import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/images_services/image_services.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/core/utils/widgets/TextBoxNormal.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/data/models/hotel_model.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class MapFilterScreen extends StatefulWidget {
  const MapFilterScreen({Key? key}) : super(key: key);

  @override
  _MapFilterScreen createState() => _MapFilterScreen();
}

class _MapFilterScreen extends State<MapFilterScreen> {
  LatLng latLngCamera = new LatLng(54.9315015, -5.0835984);
  double _zoom = 7.0;
  Set<Marker> markers = Set<Marker>();
  double lat = 54.9315015;
  double long = -5.0835984;
  List<HotelDataModel> hotelsLst = [];
  List<HotelDataModel> _dataResult = [];
  List<HotelDataModel> _dataAll = [];

  List<GlobalKey>? _key;
  TextEditingController _textcontroller = TextEditingController();

  Future<bool?> mapInit() async {
    print('mapInit');
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print('Location permissions are denied');
        return false;
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    print('grant access');
    return true;
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final GoogleMapController controller = await _controller.future;
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 9)));
  }

  goToProduct(double latitude, double longitude) async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 9)));
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    mapInit().then((value) {
      print('mapInitFutureValue');
      print(value.toString());

      if (value!) {
        print('itsTrue');
        getLocation();
        _controller.complete(controller);
      } else {
        print('itsFalse');
        return;
      }
    });
  }

  void getLocationButton() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    final GoogleMapController controller = await _controller.future;
    setState(() {
      latLngCamera = LatLng(lat, long);
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, long), zoom: 9)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWholeHotels();

    _textcontroller.addListener(_onSearchChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textcontroller.removeListener(_onSearchChange);
    super.dispose();
  }

  getWholeHotels() async {
    var resultJson = await DioHelper.get('search-hotels?count=100&page=1');
    debugPrint('ress=');
    debugPrint(resultJson.toString());
    if (resultJson != false) {
      HotelModel tmp = HotelModel.fromJson(resultJson);
      setState(() {
        hotelsLst = tmp.data!.data!;
        _dataAll = tmp.data!.data!;
      });

      _key = List.generate(hotelsLst.length, (index) => GlobalKey());
      if (hotelsLst.length > 0) {
        // getCustomMarker(context).then((value) => addMarker());
      } else {
        setState(() {
          markers.clear();
        });
      }
    }
  }

  void _onSearchChange() async {
    if (_textcontroller.text.length > 0) {
      var result = hotelsLst.where((element) {
        final nameLower =
            element.name != null ? element.name!.toLowerCase() : "";

        // final serviceLower = CategoryWithLang(element.servicesCategoryID).toString().toLowerCase();
        final queryLower = _textcontroller.text.toLowerCase();
        // return   nameLower.contains(queryLower)  || serviceLower.contains(queryLower);
        return nameLower.contains(queryLower);
      }).toList();
      setState(() {
        _dataResult = result;
        hotelsLst = _dataResult;
      });
    } else {
      setState(() {
        _dataResult = [];
        hotelsLst = _dataAll;
      });
    }
    print(_dataResult.length);
  }

  Future<Uint8List> getBytesFromAsset(
      int height, int width, Uint8List image) async {
    ui.Codec codec = await ui.instantiateImageCodec(image,
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  BitmapDescriptor? pinLocationIcon;

  getMarker(HotelDataModel row, Uint8List? markerIcon) async {
    // final Uint8List? markerIcon =
    //     await ImageServices().byteGetImage(row.photo.toString(), "Products");
    print("getMarker");
    print(markerIcon);
    if (row.icon == null) {
      if (markerIcon == null) {
        row.icon = null;
      } else {
        var test = await getBytesFromAsset(200, 200, markerIcon);
        row.icon = BitmapDescriptor.fromBytes(test);
        addMarker(row);
      }
    }

    // return pinLocationIcon;
  }

  addMarker2() async {
    markers.clear();

    if (hotelsLst.length > 0) {
      setState(() {
        for (var item in hotelsLst) {
          print("adel");
          print(item.name.toString());
          print(item.latitude.toString());
          if (item.latitude.toString() != "null") {
            print("here");
            markers.add(Marker(
              markerId: MarkerId(item.id.toString()),
              position: LatLng(double.parse(item.latitude.toString()),
                  double.parse(item.longitude.toString())),
              infoWindow: InfoWindow(title: item.name),
              onTap: () {
                Scrollable.ensureVisible(
                    _key![hotelsLst.indexOf(item)].currentContext!);
              },
              // icon: item.icon!

              // pinLocationIcon == null
              //     ? BitmapDescriptor.d
              //     : pinLocationIcon,
            ));
          }
        }
      });
    }
  }

  addMarker(HotelDataModel item) async {
    if (item.latitude != null && (double.tryParse(item.latitude!))! > 0) {
      // print('adding Marker');
      setState(() {
        markers.add(Marker(
          markerId: MarkerId(item.id.toString()),
          position: LatLng(double.parse(item.latitude.toString()),
              double.parse(item.longitude.toString())),
          infoWindow: InfoWindow(title: item.name),
          onTap: () {
            Scrollable.ensureVisible(
                _key![hotelsLst.indexOf(item)].currentContext!);
          },
          // icon: item.icon!
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                myLocationButtonEnabled: false,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: latLngCamera,
                  zoom: _zoom,
                  bearing: 270.0,
                  tilt: 30.0,
                ),
                markers: markers,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: widgetList1(context),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    getLocationButton();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: top + MediaQuery.of(context).padding.top,
                          left: side,
                          right: side),
                      child: Row(
                        children: [
                          Container(
                              height: height1,
                              width: height1,
                              padding: EdgeInsets.all(space0),
                              decoration: BoxDecoration(
                                  color: OwnTheme.colorPalette['gray'],
                                  borderRadius: BorderRadius.circular(round)),
                              child: BackIconAppBar(
                                lang: lang,
                              )),
                          SizedBox(
                            width: space1,
                          ),
                          Expanded(
                            child: CustomTextBoxNormal(
                              tec: _textcontroller,
                              onChange: (val) {},
                              hint: 'search_txt'.tr(context),
                              lang: lang,
                              suffix: Padding(
                                padding: const EdgeInsets.all(space1),
                                child: Image.asset(
                                  "assets/icons/search_icon.webp",
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetList1(BuildContext context) {
    var blockSize = (MediaQuery.of(context).size.width - side) * 0.9;
    var size = height5;
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 0, bottom: bottom),
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...hotelsLst.map((e) {
                return Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (e.latitude != null &&
                              double.parse(e.latitude!) > 0) {
                            goToProduct(double.parse(e.latitude!),
                                double.parse(e.longitude!));
                          }
                        },
                        child: mapProduct(
                          size,
                          blockSize,
                          e,
                          lang,
                          _key![hotelsLst.indexOf(e)],
                        )),

                    // SizedBox(
                    //   width: space1,
                    // )
                  ],
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }

  // _getMaps(double lat, double lng) async {
  //   final availableMaps = await MapLauncher.installedMaps;
  //   await availableMaps.first.showMarker(
  //     coords: Coords(lat, lng),
  //     title: "location",
  //     description: "building location",
  //   );
  // }

  Widget mapProduct(double size, double blockSize, HotelDataModel e,
      String lang, GlobalKey? itemKey) {
    var indictor = blockSize - (3 * space1) - size;

    double dist = calculateDistance(
        double.parse(e.latitude!), double.parse(e.longitude!), lat, long);

    return Padding(
        padding: const EdgeInsets.all(space1),
        child: Container(
          key: itemKey,
          width: blockSize,
          height: height6,
          decoration: BoxDecoration(
              color: OwnTheme.colorPalette['black'],
              borderRadius: BorderRadius.circular(round)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: height6,
                width: size,
                child: FutureBuilder<Uint8List?>(
                    future: ImageServices()
                        .byteGetImage(e.hotelImages!.first.image!),
                    builder: (BuildContext context,
                        AsyncSnapshot<Uint8List?> snapshot) {
                      if (snapshot.hasData) {
                        // getMarker(e, snapshot.data);
                        getMarkerIcon(e, snapshot.data!, Size(200, 200));
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(),
                              borderRadius: BorderRadius.circular(round)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(round),
                                topLeft: Radius.circular(round)),
                            child: Image.memory(
                              snapshot.data!,
                              width: size,
                              height: size,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }
                      return Container(
                        child: Container(
                          height: size,
                          width: size,
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: space0,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: space0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      e.name ?? '',
                      style: OwnTheme.normalBoldTextStyle(lang: lang)
                          .colorChange(color: 'white'),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: space0,
                    ),
                    Text(
                      '${e.address}',
                      style: OwnTheme.smallTextStyle(lang: lang)
                          .colorChange(color: 'white'),
                      maxLines: 1,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: OwnTheme.colorPalette['primary'],
                                ),
                                Text(
                                  '${(dist / 10).ceil()} km to city',
                                  style: OwnTheme.smallTextStyle(lang: lang)
                                      .colorChange(color: 'white'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: (double.parse(e.rate!) / 2),
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              updateOnDrag: false,
                              onRatingUpdate: (rating) {
                                // print(rating);
                              },
                            )
                          ],
                        ),
                        // Spacer(),
                        Column(
                          children: [
                            Text(
                              '\$${e.price}',
                              style: OwnTheme.avBoldTextStyle(lang: lang)
                                  .colorChange(color: 'white'),
                              maxLines: 1,
                            ),
                            Text(
                              'per_night_txt'.tr(context),
                              style: OwnTheme.smallTextStyle(lang: lang)
                                  .colorChange(color: 'white'),
                              maxLines: 1,
                            ),
                          ],
                        ),

                      ],
                    ),

                    // HomeProductIndictor(size: indictor, e: e, lang: lang),
                  ],
                ),
              )),
            ],
          ),
        ));
  }


  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

// Future<BitmapDescriptor>

  getMarkerIcon(HotelDataModel row, Uint8List imageBytes, Size size) async {
    // debugPrint('${getMarkerIcon}');
    // debugPrint('${imageBytes}');

    // if(row.icon != null ){
    //   return;
    // }
    // Color color = OwnTheme.colorPalette['available']!;
    // if(row.status ==1 ){
    //   color = OwnTheme.colorPalette['just']!;
    // }else if(row.status ==2 ){
    //   color = OwnTheme.colorPalette['available']!;
    // }else{
    //   color = OwnTheme.colorPalette['last']!;
    // }

    Color color = OwnTheme.colorPalette['primary']!;
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = color;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            Radius.circular(round)),
        tagPaint);

    Rect oval = Rect.fromLTWH(10.0, 10.0, size.width - 20, size.height - 20);
    // Add image

    ui.decodeImageFromList(imageBytes, (ui.Image img) async {
      ui.Image image = img;
      paintImage(
          canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);
      final ui.Image markerAsImage = await pictureRecorder
          .endRecording()
          .toImage(size.width.toInt(), size.height.toInt());

      // Convert image to bytes
      final ByteData? byteData =
          await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List uint8List = byteData!.buffer.asUint8List();
      var icon = BitmapDescriptor.fromBytes(uint8List);
      row.icon = icon;
      // print('icon==${row.icon.toString()}');
      // return BitmapDescriptor.fromBytes(uint8List);
      addMarker(row);
    });
    // Convert canvas to image
  }
}
