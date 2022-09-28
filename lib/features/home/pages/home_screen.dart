import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/features/explore/explore_screen.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  var searchController=TextEditingController();
  var pageController=PageController();

 HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: OwnTheme.colorPalette['black'],

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            titleSpacing: 0.0,
            expandedHeight: size.height*.6,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:EdgeInsets.zero,
              title: Stack(
                children: [
                  Container(
                     child: PageView.builder(
                       itemBuilder: (context,index){
                         return const Image(
                           fit: BoxFit.cover,
                           image: AssetImage('assets/images/hotel.jpg'),
                         );

                       },
                       controller: pageController,
                       itemCount: 3,
                     ),
                  ),
                  Positioned(
                    left:5 ,
                    top: size.height*.46,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Cape Town',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color:  OwnTheme.colorPalette['white'],
                            fontWeight: FontWeight.w400,
                            fontFamily: "fontEnBold"
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left:5 ,
                    top: size.height*.50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Extraordinary five-star \n outdoors activites',
                            style: TextStyle(
                                fontSize: 9.sp,
                                color:  OwnTheme.colorPalette['white'],
                                fontWeight: FontWeight.w400,
                                fontFamily: "fontEn"
                            ),
                          ),
                          SizedBox(width: size.width*.1,),
                          SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: const JumpingDotEffect(
                              dotColor: Colors.grey,
                              activeDotColor: Color(0xFF4FBE9F),
                              dotWidth: 7,
                              dotHeight: 7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left:5 ,
                    top: size.height*.55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        color: OwnTheme.colorPalette['primary'],
                        onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (_){
                             return ExploreScreen();
                           }));
                        },
                        child:  Text(
                          'View Hotel',
                          style: TextStyle(
                              fontSize: 8.sp,
                              color:  OwnTheme.colorPalette['white'],
                              fontWeight: FontWeight.w500,
                              fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                          ),
                        ),
                      )
                    ),
                  ),

                ],
              ),

            ),
            leading: const Text(''),

            title: Container(
              height: 100,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },

                    decoration: InputDecoration(
                      prefixIcon:  Icon(
                        Icons.search,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.05,
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 10
                      ),
                      hintText: 'Where are you going ?',
                      filled: true,
                      fillColor: const Color(0xff282828),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xff282828),
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xff282828),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width*.04,
                  vertical: size.height*.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'popular_destination'.tr(context),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color:  OwnTheme.colorPalette['white'],
                          fontWeight: FontWeight.w500,
                          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                      ),
                    ),
                    SizedBox(height: size.height*.02,),
                    SizedBox(
                      height: size.height*.2,
                      width: size.width,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image(
                                    image: const AssetImage('assets/images/paris.jpg'),
                                    fit: BoxFit.cover,
                                    width: size.width*.72,
                                  ),
                                )  ,
                                Positioned(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Paris',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "fontEnBold"
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context,index){
                            return SizedBox(width: size.width*.02,);
                          },
                          itemCount: 7
                      ),
                    ),
                    SizedBox(height: size.height*.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'best_deals'.tr(context),
                          style: TextStyle(
                              fontSize: 13.sp,
                              color:  OwnTheme.colorPalette['white'],
                              fontWeight: FontWeight.w500,
                              fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'view_all'.tr(context),
                          style: TextStyle(
                              fontSize: 11.sp,
                              color:  OwnTheme.colorPalette['primary'],
                              fontWeight: FontWeight.w500,
                              fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color:  OwnTheme.colorPalette['primary'],
                          size:  size.width*.05,

                        ),
                        SizedBox(height: size.width*.02,),

                      ],
                    ),
                    SizedBox(height: size.height*.02,),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return itemHotel(size);
                        },
                        separatorBuilder: (context,index){
                          return SizedBox(height: size.height*.02,);
                        },
                        itemCount: 4
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
  
  Widget itemHotel(Size size){
    return Container(

      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color: const Color(0xff282828),
          border: Border.all(
          color: const Color(0xff282828)
        )
      ),
      height: size.height*.18,
      child: Row(
        children: [
          Image(
            image: const AssetImage(
                'assets/images/hotel.jpg'
            ),
            fit: BoxFit.cover,
            width: size.width*.32,
            height: size.height*.18,
          ),
          SizedBox(width: size.width*.04,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grand Royal Hotel',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color:  OwnTheme.colorPalette['white'],
                      fontWeight: FontWeight.w500,
                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                  ),
                ),
                SizedBox(height: size.height*.008,),
                Text(
                  'Wembley, London',
                  style: TextStyle(
                      fontSize: 10.sp,
                      color:  OwnTheme.colorPalette['gray'],
                      fontWeight: FontWeight.w500,
                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                  ),
                ),
                SizedBox(height: size.height*.01,),
                Container(
                  height: size.height*.04,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.04,
                      ),
                      SizedBox(width: size.width*.01,),
                      Text(
                        '4,0 km to city',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color:  OwnTheme.colorPalette['gray'],
                            fontWeight: FontWeight.w500,
                            fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                        ),
                      ),
                      SizedBox(width: size.width*.07,),
                      Text(
                        '\$200',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color:  OwnTheme.colorPalette['white'],
                            fontWeight: FontWeight.w500,
                            fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: size.height*.01,),
                Container(
                  height: size.height*.03,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.03,
                      ),
                      Icon(
                        Icons.star,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.03,
                      ),
                      Icon(
                        Icons.star,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.03,
                      ),
                      Icon(
                        Icons.star,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.03,
                      ),
                      Icon(
                        Icons.star,
                        color:  OwnTheme.colorPalette['primary'],
                        size:  size.width*.03,
                      ),
                      SizedBox(width: size.width*.17,),
                      Text(
                        '/per night',
                        style: TextStyle(
                            fontSize: 9.sp,
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
  }
}
