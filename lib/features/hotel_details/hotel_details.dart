import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/local/cash_helper.dart';
import 'package:booking_app/data/models/explore_model.dart';
import 'package:booking_app/features/explore/explore_screen.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class HotelDetailsScreen extends StatelessWidget {

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  var pageController=PageController();

  Datum ?model;

  HotelDetailsScreen({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
            backgroundColor: const Color(0xff1D1D1D),

            body: CustomScrollView(
              slivers: [

                SliverAppBar(
                  titleSpacing: 0.0,
                  expandedHeight: size.height,
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
                                image: NetworkImage('http://api.mahmoudtaha.com/images/${model!.hotelImages![index].image}'),
                              );
                            },
                            controller: pageController,
                            itemCount: 3,
                          ),
                        ),
                        Positioned(
                          bottom: size.height*.105,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: size.width*.6,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,

                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xdda4a4a4),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5,),
                                  Text(
                                    '${model!.name}',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color:  OwnTheme.colorPalette['white'],
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "fontEnBold"
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          '${model!.address}',
                                          style: TextStyle(
                                              fontSize: 6.sp,
                                              color:  OwnTheme.colorPalette['white'],
                                              fontWeight: FontWeight.w500,
                                              fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        width: size.width*.25,
                                      ),
                                      Icon(
                                        Icons.location_pin,
                                        color:  OwnTheme.colorPalette['primary'],
                                        size:  size.width*.04,
                                      ),
                                      SizedBox(width: size.width*.01,),
                                      Text(
                                        '4,0 km to city',
                                        style: TextStyle(
                                            fontSize: 6.sp,
                                            color:  OwnTheme.colorPalette['white'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                        ),
                                      ),
                                      SizedBox(width: size.width*.03,),
                                      Text(
                                        '\$${model!.price}',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color:  OwnTheme.colorPalette['white'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                        ),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color:  OwnTheme.colorPalette['primary'],
                                        size:  size.width*.05,
                                      ),
                                      Text(
                                        '${model!.rate}',
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
                                            fontSize: 7.sp,
                                            color:  OwnTheme.colorPalette['gray'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                        ),
                                      ),

                                    ],
                                  ),
                                  Container(
                                    width: 200,
                                    height: 30,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10
                                    ),
                                    child: MaterialButton(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 2
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      color: OwnTheme.colorPalette['primary'],
                                      onPressed: (){
                                        AppCubit.get(context).createBook(
                                          hotelId: model!.id!,
                                          token: CashHelper.getData(key: 'token'),
                                          userId: CashHelper.getData(key: 'userId'),
                                        );
                                      },
                                      child:  Text(
                                        'book_now'.tr(context),
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color:  OwnTheme.colorPalette['white'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                  ),
                  toolbarHeight: size.height*.07,
                  centerTitle: true,
                  leading: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 0, 5),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor:const Color(0xdda4a4a4),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: OwnTheme.colorPalette['black'],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 5
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: OwnTheme.colorPalette['black'],
                        child: Icon(
                          Icons.favorite_border,
                          color: OwnTheme.colorPalette['primary'],
                        ),
                      ),
                    )
                  ],

                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width*.04,
                        vertical: size.height*.01,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height*.015,),
                          Row(
                            children: [
                              Text(
                                '${model!.name}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '\$${model!.price}',
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
                          SizedBox(height: size.height*.015,),

                          Row(
                            children: [
                              Container(
                                child: Text(
                                  '${model!.address}',
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color:  Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: size.width*.42,
                              ),
                              Icon(
                                Icons.location_pin,
                                color:  OwnTheme.colorPalette['primary'],
                                size:  size.width*.04,
                              ),
                              SizedBox(width: size.width*.01,),
                              Text(
                                '4,0 km to city',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                ' /per night',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color:  Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: size.height*.02,),
                          Divider(
                            color:  Colors.grey.shade600,

                          ),
                          SizedBox(height: size.height*.01,),
                          Text(
                            'Summery',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color:  OwnTheme.colorPalette['white'],
                                fontWeight: FontWeight.w500,
                                fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                            ),
                          ),
                          SizedBox(height: size.height*.005,),
                          Text(
                            '${model!.description}',
                            style: TextStyle(
                                fontSize: 9.sp,
                                color:  Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                                fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                            ),
                          ),
                          SizedBox(height: size.height*.02,),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xff282828),
                                border: Border.all(
                                    color: const Color(0xff282828)
                                )
                            ),
                            child: Column(
                              children: [

                                Row(
                                  children: [
                                    Text(
                                      '${model!.rate}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color:  OwnTheme.colorPalette['primary'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                      ),
                                    ),
                                    SizedBox(width: size.width*.07),
                                    Text(
                                      'Overall rating',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height*.01,),
                                Row(
                                  children: [
                                    Text(
                                      'Room',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                      ),
                                    ),
                                    SizedBox(width: size.width*.06,),
                                    LinearPercentIndicator(
                                      width: 200,
                                      animation: true,
                                      lineHeight: 8.0,
                                      animationDuration: 2500,
                                      percent: 0.8,
                                      barRadius:const Radius.circular(25),
                                      progressColor: Colors.green,
                                    ),


                                  ],

                                ),
                                SizedBox(height: size.height*.03,),
                                Row(
                                  children: [
                                    Text(
                                      'Services',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                      ),
                                    ),
                                    SizedBox(width: size.width*.06,),
                                    LinearPercentIndicator(
                                      width: 200,
                                      animation: true,
                                      lineHeight: 8.0,
                                      animationDuration: 2500,
                                      percent: 0.9,
                                      barRadius:const Radius.circular(25),
                                      progressColor: Colors.green,
                                    ),


                                  ],

                                ),
                                SizedBox(height: size.height*.03,),
                                Row(
                                  children: [
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                      ),
                                    ),
                                    SizedBox(width: size.width*.06,),
                                    LinearPercentIndicator(
                                      width: 200,
                                      animation: true,
                                      lineHeight: 8.0,
                                      animationDuration: 2500,
                                      percent: 0.7,
                                      barRadius:const Radius.circular(25),
                                      progressColor: Colors.green,
                                    ),


                                  ],

                                ),
                                SizedBox(height: size.height*.03,),
                                Row(
                                  children: [
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color:  OwnTheme.colorPalette['white'],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                      ),
                                    ),
                                    SizedBox(width: size.width*.06,),
                                    LinearPercentIndicator(
                                      width: 200,
                                      animation: true,
                                      lineHeight: 8.0,
                                      animationDuration: 2500,
                                      percent: 0.9,
                                      barRadius:const Radius.circular(25),
                                      progressColor: Colors.green,
                                    ),


                                  ],

                                ),
                                const SizedBox(width: 10,),


                              ],
                            ),
                          ),
                          SizedBox(height: size.height*.03,),
                          Row(
                            children: [
                              Text(
                                'Photo',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'View all',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color:  OwnTheme.colorPalette['primary'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: OwnTheme.colorPalette['primary'],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*.015,),

                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                            ),
                            height: 80,
                            width: double.infinity,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                     width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image:  DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('http://api.mahmoudtaha.com/images/${model!.hotelImages![index].image}'),
                                        )

                                    ),
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return const SizedBox(width: 10,);
                                },
                                itemCount:model!.hotelImages!.length
                            ),
                          ),
                          SizedBox(height: size.height*.03,),
                          Row(
                            children: [
                              Text(
                                'Reviews',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'View all',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color:  OwnTheme.colorPalette['primary'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: OwnTheme.colorPalette['primary'],
                              ),

                            ],

                          ),

                          Container(
                            height: size.height*.55,
                            width: double.infinity,
                            child: ListView.separated(
                              shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Image(
                                              image: NetworkImage('https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg?w=740&t=st=1664622811~exp=1664623411~hmac=87d787fe31c4c6af75ae43ea4818f22f07f90f37f836ef603fb39d800f9e1486'),
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(width: 20,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Alexia Jane',
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color:  OwnTheme.colorPalette['white'],
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                                  ),
                                                ),
                                                Text(
                                                  'Last Update21 May, 2019',
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color:  Colors.grey.shade600,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                                  ),
                                                ),
                                                Text(
                                                  '(8.0)',
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color:  OwnTheme.colorPalette['white'],
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height: 15,),
                                        Text(
                                          'Last Update21 May, 2019 Last Update21 May, 2019 Last Update21 May, 2019 Last Update21 May, 2019',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color:  Colors.grey.shade600,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                        Align(
                                          alignment: AlignmentDirectional.bottomEnd,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Reply',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color:  OwnTheme.colorPalette['primary'],
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_rounded,
                                                color: OwnTheme.colorPalette['primary'],
                                              ),
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.end,
                                          ),
                                        )

                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return Divider(
                                    color: Colors.grey.shade600,
                                  );
                                },
                                itemCount: 2
                            ),
                          ),

                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/map.jpg'),
                              )
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10
                            ),
                            child: MaterialButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 2
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              color: OwnTheme.colorPalette['primary'],
                              onPressed: (){
                                AppCubit.get(context).createBook(
                                  hotelId: model!.id!,
                                  token: CashHelper.getData(key: 'token'),
                                  userId: CashHelper.getData(key: 'userId'),
                                );
                              },
                              child:  Text(
                                'book_now'.tr(context),
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),




                        ],
                      ),
                    ),
                  ),
                ),

              ],
            )
        );
      },
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
