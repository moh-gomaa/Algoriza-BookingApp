import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BookHotel extends StatelessWidget {
  var pageController1 = PageController();
  var pageController2 = PageController();
  var pageController3 = PageController();
  var pageController4 = PageController();
  var pageController5 = PageController();
  String hotelName;
  int hotelId;
   BookHotel({Key? key,required this.hotelName,required this.hotelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
            return Scaffold(
              backgroundColor: Color(0xff191919),
              appBar: AppBar(
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Color(0xff191919),
                title:  Text(
                  hotelName,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color:  OwnTheme.colorPalette['white'],
                      fontWeight: FontWeight.w700,
                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                   child: Column(
                     children: [
                       Column(
                         children: [
                           Container(
                             alignment: Alignment.bottomCenter,
                             width: double.infinity,
                             height: 200,
                             child: PageView.builder(
                                 controller: pageController1,
                                 itemBuilder: (context,index){
                                     return Container(
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  NetworkImage('${AppCubit.get(context).deluxeRoomImages[index]}')
                                         )
                                       ),
                                       child: Align(
                                         alignment: Alignment.bottomCenter,
                                         child: SmoothPageIndicator(
                                           controller: pageController1,
                                           count: 3,
                                           effect: const JumpingDotEffect(
                                             dotColor: Colors.grey,
                                             activeDotColor: Color(0xFF4FBE9F),
                                             dotWidth: 12,
                                             dotHeight: 12,
                                           ),
                                         ),
                                       ),
                                     );
                                 },
                                 itemCount: 3,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 10,
                               vertical: 2
                             ),
                             child: Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       'deluxe_room'.tr(context),
                                       style: TextStyle(
                                           fontSize: 15.sp,
                                           color:  OwnTheme.colorPalette['white'],
                                           fontWeight: FontWeight.w400,
                                           fontFamily: "fontEnBold"
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Row(
                                         children: [
                                           Text(
                                             '\$180',
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),
                                           Text(
                                             'per_night'.tr(context),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Spacer(),
                                 Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Container(
                                       width: 120,
                                       height: 50,
                                       child: MaterialButton(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 12,
                                             vertical: 2
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30)
                                         ),
                                         color: OwnTheme.colorPalette['primary'],
                                         onPressed: (){
                                           //
                                           // AppCubit.get(context).getExplore().then((value) {
                                           //   Navigator.push(context, MaterialPageRoute(builder: (_){
                                           //     return ExploreScreen();
                                           //   }));
                                           // });
                                           AppCubit.get(context).createBook(
                                             hotelId: hotelId,
                                             token: 't0H06toGOXfM78eadSdNDVF9frlUVzEQCYsdFrXZvzozVO5vSc71zxAc7pwn',
                                             userId: 15 ,
                                           );
                                         },
                                         child:  Text(
                                           'book_now'.tr(context),
                                           style: TextStyle(
                                               fontSize: 11.sp,
                                               color:  OwnTheme.colorPalette['white'],
                                               fontWeight: FontWeight.w500,
                                               fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                           ),
                                         ),
                                       ),
                                     )
                                 ),
                               ],
                             ),
                           ),
                           Row(
                              children: [
                                SizedBox(width: 15,),
                                Text(
                                  'details'.tr(context),
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "fontEn"
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'more_details'.tr(context),
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "fontEnBold"
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 20,)

                              ],
                           )
                         ],
                       ),
                       SizedBox(height: 15,),
                       Column(
                         children: [
                           Container(
                             alignment: Alignment.bottomCenter,
                             width: double.infinity,
                             height: 200,
                             child: PageView.builder(
                               controller: pageController2,
                               itemBuilder: (context,index){
                                 return Container(
                                   decoration: BoxDecoration(
                                       image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  NetworkImage('${AppCubit.get(context).premiumRoomImages[index]}')
                                       )
                                   ),
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                     child: SmoothPageIndicator(
                                       controller: pageController2,
                                       count: 3,
                                       effect: const JumpingDotEffect(
                                         dotColor: Colors.grey,
                                         activeDotColor: Color(0xFF4FBE9F),
                                         dotWidth: 12,
                                         dotHeight: 12,
                                       ),
                                     ),
                                   ),
                                 );
                               },
                               itemCount: 3,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10,
                                 vertical: 2
                             ),
                             child: Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       'premium_room'.tr(context),
                                       style: TextStyle(
                                           fontSize: 15.sp,
                                           color:  OwnTheme.colorPalette['white'],
                                           fontWeight: FontWeight.w400,
                                           fontFamily: "fontEnBold"
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Row(
                                         children: [
                                           Text(
                                             '\$180',
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),
                                           Text(
                                             'per_night'.tr(context),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Spacer(),
                                 Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Container(
                                       width: 120,
                                       height: 50,
                                       child: MaterialButton(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 12,
                                             vertical: 2
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30)
                                         ),
                                         color: OwnTheme.colorPalette['primary'],
                                         onPressed: (){
                                           //
                                           // AppCubit.get(context).getExplore().then((value) {
                                           //   Navigator.push(context, MaterialPageRoute(builder: (_){
                                           //     return ExploreScreen();
                                           //   }));
                                           // });
                                         },
                                         child:  Text(
                                           'book_now'.tr(context),
                                           style: TextStyle(
                                               fontSize: 11.sp,
                                               color:  OwnTheme.colorPalette['white'],
                                               fontWeight: FontWeight.w500,
                                               fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                           ),
                                         ),
                                       ),
                                     )
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               Text(
                                 'premium_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEn"
                                 ),
                               ),
                               Spacer(),
                               Text(
                                 'more_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEnBold"
                                 ),
                               ),
                               Icon(
                                 Icons.keyboard_arrow_down,
                                 color: Colors.white,
                                 size: 24,
                               ),
                               SizedBox(width: 20,)

                             ],
                           )
                         ],
                       ),
                       SizedBox(height: 15,),
                       Column(
                         children: [
                           Container(
                             alignment: Alignment.bottomCenter,
                             width: double.infinity,
                             height: 200,
                             child: PageView.builder(
                               controller: pageController3,
                               itemBuilder: (context,index){
                                 return Container(
                                   decoration: BoxDecoration(
                                       image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  NetworkImage('${AppCubit.get(context).queenRoomImages[index]}')
                                       )
                                   ),
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                     child: SmoothPageIndicator(
                                       controller: pageController3,
                                       count: 3,
                                       effect: const JumpingDotEffect(
                                         dotColor: Colors.grey,
                                         activeDotColor: Color(0xFF4FBE9F),
                                         dotWidth: 12,
                                         dotHeight: 12,
                                       ),
                                     ),
                                   ),
                                 );
                               },
                               itemCount: 3,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10,
                                 vertical: 2
                             ),
                             child: Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       'queen_room'.tr(context),
                                       style: TextStyle(
                                           fontSize: 15.sp,
                                           color:  OwnTheme.colorPalette['white'],
                                           fontWeight: FontWeight.w400,
                                           fontFamily: "fontEnBold"
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Row(
                                         children: [
                                           Text(
                                             '\$180',
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),
                                           Text(
                                             'per_night'.tr(context),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Spacer(),
                                 Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Container(
                                       width: 120,
                                       height: 50,
                                       child: MaterialButton(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 12,
                                             vertical: 2
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30)
                                         ),
                                         color: OwnTheme.colorPalette['primary'],
                                         onPressed: (){
                                           //
                                           // AppCubit.get(context).getExplore().then((value) {
                                           //   Navigator.push(context, MaterialPageRoute(builder: (_){
                                           //     return ExploreScreen();
                                           //   }));
                                           // });
                                         },
                                         child:  Text(
                                           'book_now'.tr(context),
                                           style: TextStyle(
                                               fontSize: 11.sp,
                                               color:  OwnTheme.colorPalette['white'],
                                               fontWeight: FontWeight.w500,
                                               fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                           ),
                                         ),
                                       ),
                                     )
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               Text(
                                 'queen_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEn"
                                 ),
                               ),
                               Spacer(),
                               Text(
                                 'more_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEnBold"
                                 ),
                               ),
                               Icon(
                                 Icons.keyboard_arrow_down,
                                 color: Colors.white,
                                 size: 24,
                               ),
                               SizedBox(width: 20,)

                             ],
                           )
                         ],
                       ),
                       SizedBox(height: 15,),
                       Column(
                         children: [
                           Container(
                             alignment: Alignment.bottomCenter,
                             width: double.infinity,
                             height: 200,
                             child: PageView.builder(
                               controller: pageController4,
                               itemBuilder: (context,index){
                                 return Container(
                                   decoration: BoxDecoration(
                                       image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  NetworkImage('${AppCubit.get(context).kingRoomImages[index]}')
                                       )
                                   ),
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                     child: SmoothPageIndicator(
                                       controller: pageController4,
                                       count: 3,
                                       effect: const JumpingDotEffect(
                                         dotColor: Colors.grey,
                                         activeDotColor: Color(0xFF4FBE9F),
                                         dotWidth: 12,
                                         dotHeight: 12,
                                       ),
                                     ),
                                   ),
                                 );
                               },
                               itemCount: 3,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10,
                                 vertical: 2
                             ),
                             child: Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       'king_room'.tr(context),
                                       style: TextStyle(
                                           fontSize: 15.sp,
                                           color:  OwnTheme.colorPalette['white'],
                                           fontWeight: FontWeight.w400,
                                           fontFamily: "fontEnBold"
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Row(
                                         children: [
                                           Text(
                                             '\$180',
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),
                                           Text(
                                             'per_night'.tr(context),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Spacer(),
                                 Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Container(
                                       width: 120,
                                       height: 50,
                                       child: MaterialButton(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 12,
                                             vertical: 2
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30)
                                         ),
                                         color: OwnTheme.colorPalette['primary'],
                                         onPressed: (){
                                           //
                                           // AppCubit.get(context).getExplore().then((value) {
                                           //   Navigator.push(context, MaterialPageRoute(builder: (_){
                                           //     return ExploreScreen();
                                           //   }));
                                           // });
                                         },
                                         child:  Text(
                                           'book_now'.tr(context),
                                           style: TextStyle(
                                               fontSize: 11.sp,
                                               color:  OwnTheme.colorPalette['white'],
                                               fontWeight: FontWeight.w500,
                                               fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                           ),
                                         ),
                                       ),
                                     )
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               Text(
                                 'queen_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEn"
                                 ),
                               ),
                               Spacer(),
                               Text(
                                 'more_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEnBold"
                                 ),
                               ),
                               Icon(
                                 Icons.keyboard_arrow_down,
                                 color: Colors.white,
                                 size: 24,
                               ),
                               SizedBox(width: 20,)

                             ],
                           )
                         ],
                       ),
                       SizedBox(height: 15,),
                       Column(
                         children: [
                           Container(
                             alignment: Alignment.bottomCenter,
                             width: double.infinity,
                             height: 200,
                             child: PageView.builder(
                               controller: pageController5,
                               itemBuilder: (context,index){
                                 return Container(
                                   decoration: BoxDecoration(
                                       image: DecorationImage(
                                           fit: BoxFit.cover,
                                           image:  NetworkImage('${AppCubit.get(context).hollywoodRoomImages[index]}')
                                       )
                                   ),
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                     child: SmoothPageIndicator(
                                       controller: pageController5,
                                       count: 3,
                                       effect: const JumpingDotEffect(
                                         dotColor: Colors.grey,
                                         activeDotColor: Color(0xFF4FBE9F),
                                         dotWidth: 12,
                                         dotHeight: 12,
                                       ),
                                     ),
                                   ),
                                 );
                               },
                               itemCount: 3,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 10,
                                 vertical: 2
                             ),
                             child: Row(
                               children: [
                                 Column(
                                   children: [
                                     Text(
                                       'hooly_room'.tr(context),
                                       style: TextStyle(
                                           fontSize: 14.sp,
                                           color:  OwnTheme.colorPalette['white'],
                                           fontWeight: FontWeight.w400,
                                           fontFamily: "fontEnBold"
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.symmetric(
                                         vertical: 15
                                       ),
                                       child: Row(
                                         children: [
                                           Text(
                                             '\$180',
                                             style: TextStyle(
                                                 fontSize: 14.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),
                                           Text(
                                             'per_night'.tr(context),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 color:  OwnTheme.colorPalette['white'],
                                                 fontWeight: FontWeight.w400,
                                                 fontFamily: "fontEnBold"
                                             ),
                                           ),

                                         ],
                                       ),
                                     ),

                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Spacer(),
                                 Padding(
                                     padding: const EdgeInsets.all(15.0),
                                     child: Container(
                                       width: 120,
                                       height: 50,
                                       child: MaterialButton(
                                         padding: const EdgeInsets.symmetric(
                                             horizontal: 12,
                                             vertical: 2
                                         ),
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30)
                                         ),
                                         color: OwnTheme.colorPalette['primary'],
                                         onPressed: (){
                                           //
                                           // AppCubit.get(context).getExplore().then((value) {
                                           //   Navigator.push(context, MaterialPageRoute(builder: (_){
                                           //     return ExploreScreen();
                                           //   }));
                                           // });

                                         },
                                         child:  Text(
                                           'book_now'.tr(context),
                                           style: TextStyle(
                                               fontSize: 11.sp,
                                               color:  OwnTheme.colorPalette['white'],
                                               fontWeight: FontWeight.w500,
                                               fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                           ),
                                         ),
                                       ),
                                     )
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               Text(
                                 'queen_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEn"
                                 ),
                               ),
                               Spacer(),
                               Text(
                                 'more_details'.tr(context),
                                 style: TextStyle(
                                     fontSize: 10.sp,
                                     color:  OwnTheme.colorPalette['white'],
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "fontEnBold"
                                 ),
                               ),
                               Icon(
                                 Icons.keyboard_arrow_down,
                                 color: Colors.white,
                                 size: 24,
                               ),
                               SizedBox(width: 20,)

                             ],
                           )
                         ],
                       ),


                     ],
                   ),
                ),
              ),
            );
        },
    );

  }
}
