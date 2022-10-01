import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/features/filter/pages/filter_screen.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class ViewFilterList extends StatelessWidget {
  const ViewFilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        Text(
                          'View Filter List',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: OwnTheme.colorPalette['white'],
                              fontWeight: FontWeight.w500,
                              fontFamily:
                                  lang == "ar" ? "fontArBold" : "fontEnBold"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff282828),
                                border:
                                    Border.all(color: const Color(0xff282828))),
                            height: size.height * .18,
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      'http://api.mahmoudtaha.com/images/${filteredHotelList[index].hotelImages!.first.image}'),
                                  fit: BoxFit.cover,
                                  width: size.width * .32,
                                  height: size.height * .18,
                                ),
                                SizedBox(
                                  width: size.width * .04,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Text(
                                          '${filteredHotelList[index].name}',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: OwnTheme
                                                  .colorPalette['white'],
                                              fontWeight: FontWeight.w500,
                                              fontFamily: lang == "ar"
                                                  ? "fontArBold"
                                                  : "fontEnBold"),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .008,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text(
                                          '${filteredHotelList[index].address}',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color:
                                                  OwnTheme.colorPalette['gray'],
                                              fontWeight: FontWeight.w500,
                                              fontFamily: lang == "ar"
                                                  ? "fontArBold"
                                                  : "fontEnBold"),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      SizedBox(
                                        height: size.height * .04,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: OwnTheme
                                                  .colorPalette['primary'],
                                              size: size.width * .04,
                                            ),
                                            SizedBox(
                                              width: size.width * .01,
                                            ),
                                            Text(
                                              '4,0 km to city',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: OwnTheme
                                                      .colorPalette['gray'],
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: lang == "ar"
                                                      ? "fontArBold"
                                                      : "fontEnBold"),
                                            ),
                                            SizedBox(
                                              width: size.width * .07,
                                            ),
                                            Text(
                                              '${filteredHotelList[index].price}',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: OwnTheme
                                                      .colorPalette['white'],
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: lang == "ar"
                                                      ? "fontArBold"
                                                      : "fontEnBold"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      SizedBox(
                                        height: size.height * .03,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: OwnTheme
                                                  .colorPalette['primary'],
                                              size: size.width * .05,
                                            ),
                                            Text(
                                              '${filteredHotelList[index].rate}',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: OwnTheme
                                                      .colorPalette['white'],
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: lang == "ar"
                                                      ? "fontArBold"
                                                      : "fontEnBold"),
                                            ),
                                            SizedBox(
                                              width: size.width * .17,
                                            ),
                                            Text(
                                              '/per night',
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: OwnTheme
                                                      .colorPalette['gray'],
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: lang == "ar"
                                                      ? "fontArBold"
                                                      : "fontEnBold"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: filteredHotelList.length)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
