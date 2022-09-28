import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:  OwnTheme.colorPalette['black'],
        appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
        backgroundColor:  OwnTheme.colorPalette['black'],
        title:  Text(
        'explore'.tr(context),
          style: TextStyle(
          fontSize: 16.sp,
          color:  OwnTheme.colorPalette['white'],
          fontWeight: FontWeight.w500,
          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
          ),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Container(
              //   height: 100,
              //   width: 100,
              //   child: Row(
              //     children: [
              //       TextFormField(
              //         // controller: searchController,
              //         keyboardType: TextInputType.text,
              //         onFieldSubmitted: (String value) {
              //           print(value);
              //         },
              //         onChanged: (String value) {
              //           print(value);
              //         },
              //
              //         decoration: InputDecoration(
              //
              //           hintStyle: const TextStyle(
              //               fontSize: 10
              //           ),
              //           hintText: 'London..',
              //           filled: true,
              //           fillColor: const Color(0xff282828),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(15),
              //             borderSide: const BorderSide(
              //               color: Color(0xff282828),
              //             ),
              //           ),
              //           focusedBorder:  OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(15),
              //             borderSide: const BorderSide(
              //               color: Color(0xff282828),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(width: 10,),
              //       CircleAvatar(
              //         radius: 30,
              //         child: Icon(
              //             Icons.search
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // )     ,

              buildUpComingWidget(context , size)
            ],
          ),
        ),
      ),
    );
  }
  Widget buildUpComingWidget(context , size){

    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: 10
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
            ),
            child: Column(
              children: [
                Text(
                  '01 Sep - 05 Sep, 1 Room 2 People',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color:  OwnTheme.colorPalette['white'],
                      fontWeight: FontWeight.w500,
                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                  ),
                ),
                SizedBox(height: size.height*.01,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff282828),
                      border: Border.all(
                          color: const Color(0xff282828)
                      )
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: const AssetImage(
                                'assets/images/hotel.jpg'
                            ),
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.height*.18,
                          ),
                          Positioned(
                            child: IconButton(
                              icon: const CircleAvatar(
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                ),
                                radius: 28,
                                backgroundColor: Color(0xff282828),
                              ),
                              onPressed: (){

                              },
                            ),
                            right: 10,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Grand Royal Hotel',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color:  OwnTheme.colorPalette['white'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$180',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color:  OwnTheme.colorPalette['white'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                            ),
                            SizedBox(width: size.width*.02,),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Wembley,London ',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color:  OwnTheme.colorPalette['white'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                            ),
                            Icon(
                              Icons.location_pin,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            Text(
                              '4,0 km to city',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color:  OwnTheme.colorPalette['gray'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                            ),
                            Spacer(),
                            Text(
                              '/per night ',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color:  OwnTheme.colorPalette['gray'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                            ),
                            SizedBox(width: size.width*.01,),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            Icon(
                              Icons.star,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            Icon(
                              Icons.star,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            Icon(
                              Icons.star,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            Icon(
                              Icons.star,
                              color:  OwnTheme.colorPalette['primary'],
                              size:  size.width*.04,
                            ),
                            SizedBox(width: size.width*.04,),
                            Text(
                              '80Reviews',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color:  OwnTheme.colorPalette['gray'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
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
        separatorBuilder: (context,index){
          return SizedBox(height: 10,);
        },
        itemCount: 10
    );


  }
}
