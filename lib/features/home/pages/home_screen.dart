import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/data/models/explore_model.dart';
import 'package:booking_app/features/explore/explore_screen.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/features/hotel_details/hotel_details.dart';
import 'package:booking_app/features/search_screen/search_screen.dart';
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
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){



        },
      builder: (context,state){
          return Scaffold(
              backgroundColor: Color(0xff1D1D1D),

              body: CustomScrollView(
                slivers: [

                  SliverAppBar(
                    titleSpacing: 0.0,
                    expandedHeight: size.height*.65,
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
                                return Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage('${AppCubit.get(context).homeImages[index]}'),
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

                                    AppCubit.get(context).getExplore().then((value) {});
                                    Navigator.push(context, MaterialPageRoute(builder: (_){
                                      return ExploreScreen();
                                    }));
                                  },
                                  child:  Text(
                                    'view_hotel'.tr(context),
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
                    toolbarHeight: size.height*.12,
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              child: TextFormField(
                                enabled: false,
                                // controller: searchController,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                                decoration: InputDecoration(
                                  prefixIcon:  Icon(
                                    Icons.search,
                                    color:  OwnTheme.colorPalette['primary'],
                                    size:  size.width*.06,
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                  hintText: 'where_are_you_going'.tr(context),
                                  filled: true,
                                  fillColor: const Color(0xff282828),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color(0xff282828),
                                    ),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Color(0xff282828),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return SearchScreen();
                              }));
                            },
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
                                            image: NetworkImage('${AppCubit.get(context).popularDestinationImages[index]}'),
                                            fit: BoxFit.cover,
                                            width: size.width*.72,
                                          ),
                                        )  ,
                                        Positioned(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${AppCubit.get(context).popularDestinationTitles[index]}',
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
                                  itemCount: AppCubit.get(context).popularDestinationImages.length
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
                            AppCubit.get(context).exploreModel!=null?
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context,index){
                                  return itemHotel(size,AppCubit.get(context).exploreModel!,index,context);
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(height: size.height*.02,);
                                },
                                itemCount: AppCubit.get(context).exploreModel!.data!.data!.length
                            ):
                             Center(
                               child: CircularProgressIndicator(
                                 color: OwnTheme.colorPalette['primary'],
                               ),
                             )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
          );
      },
    );
  }
  
  Widget itemHotel(Size size,ExploreModel model,index,context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){

          return HotelDetailsScreen(model: model.data!.data![index]);

        }));
      },
      child: Container(

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
              image:  NetworkImage(
                  'http://api.mahmoudtaha.com/images/${model.data!.data![index].hotelImages![0].image}'
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
                  Container(
                    child: Text(
                     '${model.data!.data![index].name}',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color:  OwnTheme.colorPalette['white'],
                          fontWeight: FontWeight.w500,
                          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    width: 150,

                  ),
                  SizedBox(height: size.height*.008,),
                  Container(
                    child: Text(
                      '${model.data!.data![index].address}',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color:  OwnTheme.colorPalette['gray'],
                          fontWeight: FontWeight.w500,
                          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    width: 150,
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
                          '\$ ${model.data!.data![index].price}',
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
                          size:  size.width*.05,
                        ),
                        Text(
                          '${model.data!.data![index].rate}',
                          style: TextStyle(
                              fontSize: 11.sp,
                              color:  OwnTheme.colorPalette['gray'],
                              fontWeight: FontWeight.w500,
                              fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                          ),
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
      ),
    );
  }
}
