import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/data/database/facility_helper.dart';
import 'package:booking_app/data/models/facility_model.dart';
import 'package:booking_app/data/models/hotel_model.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
List<HotelDataModel> filteredHotelList = [];

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  List<HotelDataModel> hotelsLst = [];
  List<double> pricesLst = [];
  List<FacilityModel> facilitiesLst = [];
  List<int> selectedFacilitiesLst = [];
  double min = 0.0;
  double max = 10.0;
  late double low;
  late double high;
  TextEditingController address = TextEditingController();

  @override
  void initState() {
    super.initState();
    low = min;
    high = max;
    getWholeHotels();
    getFacilitiesDateLocal();
  }

  getWholeHotels() async {
    var resultJson = await DioHelper.get('search-hotels?count=100&page=1');
    // debugPrint('ress=');
    // debugPrint(resultJson);
    if (resultJson != false) {
      HotelModel tmp = HotelModel.fromJson(resultJson);
      setState(() {
        hotelsLst = tmp.data!.data!;
      });

      for (var item in hotelsLst) {
        if (!(pricesLst.contains(item.price))) {
          pricesLst.add(double.parse(item.price!));
        }
      }
      pricesLst.sort();
      pricesLst = pricesLst.toSet().toList();
      // debugPrint('prices==$pricesLst');
      setState(() {
        min = pricesLst.first;
        max = pricesLst.last;
        low = pricesLst.first;
        high = pricesLst.last;
      });
    }
  }

  getFacilitiesDate() async {
    var resultJson = await DioHelper.get('facilities');
    // print(resultJson);
    if (resultJson != false) {
      List<FacilityModel> tmp = [];
      for (var item in resultJson['data']) {
        tmp.add(FacilityModel.fromJson(item));
      }
      for (var item in tmp) {
        setState(() {
          item.isSelected = false;
        });
      }
      setState(() {
        facilitiesLst = tmp;
      });
      // debugPrint('facilitiesLstLength== ${facilitiesLst.length}');

      FacilitiesSaveLocal();
    }
  }

  FacilitiesSaveLocal() async {
    FacilityHelper db = FacilityHelper();
    await db.deleteAll();
    for (var row in facilitiesLst) {
      await db.savePost(row);
    }
  }

  Future<void> getFacilitiesDateLocal() async {
    FacilityHelper db = FacilityHelper();
    var tmp = await db.getAll();
    if (tmp.length == 0) {
      getFacilitiesDate();
    } else {
      for (var item in tmp) {
        setState(() {
          item.isSelected = false;
        });
      }
      setState(() {
        facilitiesLst = tmp;
      });

      // debugPrint('facilitiesLstLength== ${facilitiesLst.length}');

      getFacilitiesDate();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            lang: lang,
            leadingWidget: BackIconAppBar(
              lang: lang,
            ),
          ).safeArea(),
          Padding(
              padding: const EdgeInsets.only(
                  bottom: bottom, right: side, left: side),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'filter_txt'.tr(context),
                          style: OwnTheme.avBoldTextStyle(lang: lang)
                              .colorChange(color: 'white'),
                        ),
                        SizedBox(
                          height: space2,
                        ),
                        Text(
                          'address_txt'.tr(context),
                          style: OwnTheme.normalBoldTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: space0),
                          child: TextFormField(
                            style: OwnTheme.normalBoldTextStyle(lang: lang)
                                .colorChange(color: 'white'),
                            controller: address,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (String value) {},
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: OwnTheme.colorPalette['bgGray'],
                              labelText: 'address_desc'.tr(context),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: OwnTheme.colorPalette['primary']!,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(round),
                              ),
                              labelStyle:
                                  OwnTheme.normalBoldTextStyle(lang: lang)
                                      .colorChange(color: 'gray'),
                            ),
                          ),
                        ),
                        Text(
                          'price_txt'.tr(context),
                          style: OwnTheme.normalBoldTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                        RangeSlider(
                          min: min,
                          max: max,
                          values: RangeValues(low, high),
                          divisions:
                              pricesLst.length > 0 ? pricesLst.length : 4,
                          labels: RangeLabels(
                              '\$${low.round()}', '\$${high.round()} EGP'),
                          onChanged: (values) => setState(() {
                            low = values.start;
                            high = values.end;
                          }),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'facilities_txt'.tr(context),
                    style: OwnTheme.normalBoldTextStyle(lang: lang)
                        .colorChange(color: 'gray'),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.zero,
                        childAspectRatio: 2.5,
                        children: [
                          ...facilitiesLst.map((e) => Row(
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     if (selectedFacilitiesLst
                                  //         .contains(e.id)) {
                                  //       selectedFacilitiesLst.remove(e.id);
                                  //     } else {
                                  //       selectedFacilitiesLst.add(e.id!);
                                  //     }
                                  //     setState(() {
                                  //       e.isSelected = !e.isSelected!;
                                  //     });
                                  //   },
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         shape: BoxShape.circle,
                                  //         color:
                                  //             OwnTheme.colorPalette['primary']),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(space0),
                                  //       child:
                                  //       e.isSelected!
                                  //           ? Icon(
                                  //               Icons.check,
                                  //               size: 30.0,
                                  //               color: Colors.white,
                                  //             )
                                  //           : Icon(
                                  //               Icons.check_box_outline_blank,
                                  //               size: 30.0,
                                  //               color: OwnTheme
                                  //                   .colorPalette['primary']),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () {
                                      if (selectedFacilitiesLst
                                          .contains(e.id)) {
                                        selectedFacilitiesLst.remove(e.id);
                                      } else {
                                        selectedFacilitiesLst.add(e.id!);
                                      }
                                      setState(() {
                                        e.isSelected = !e.isSelected!;
                                      });
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.loose,
                                      children: [
                                        CircleAvatar(
                                            radius: 20.sp,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(space0),
                                              child: CachedNetworkImage(
                                                imageUrl: '${e.image}',
                                              ),
                                            )),
                                        e.isSelected!
                                            ? CircleAvatar(
                                                radius: 20.sp,
                                                backgroundColor: OwnTheme
                                                    .colorPalette['gray']!
                                                    .withOpacity(0.7),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : CircleAvatar(
                                                radius: 20.sp,
                                                backgroundColor:
                                                    Colors.transparent,
                                              )
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: space0,
                                  ),
                                  Text(
                                    '${e.name}',
                                    style: OwnTheme.normalTextStyle(lang: lang)
                                        .colorChange(color: 'white'),
                                  )
                                ],
                              ))
                        ],
                      )),
                  ButtonKey(
                    buttonText: 'apply_txt'.tr(context),
                    function: () {
                      applyFilter();
                    },
                  )
                ],
              )),
        ],
      ),
    ));
  }

  applyFilter() async {
    debugPrint('$selectedFacilitiesLst');
    String query = 'search-hotels?';
    if (address.text != '') query = '${query}address=${address.text}&';
    if (low != null) query = query = '${query}min_price=${low}&';
    if (high != null) query = query = '${query}max_price=${high}&';
    if (selectedFacilitiesLst.length > 0)
      for (var i = 0; i < selectedFacilitiesLst.length; i++) {
        query = query = '${query}facilities[$i]=${selectedFacilitiesLst[i]}&';
      }
    String finalQuery = query.substring(0, query.length - 1);
    debugPrint(baseUrl + finalQuery);
    var resultJson = await DioHelper.get(finalQuery);

    if (resultJson != false) {
      for (var item in resultJson['data']['data']) {
        filteredHotelList.add(HotelDataModel.fromJson(item));
      }
      debugPrint('filteredHotelList.length');
      debugPrint(filteredHotelList.length.toString());
      Navigator.pushReplacementNamed(context, '/viewFilter');



    }
  }
}
