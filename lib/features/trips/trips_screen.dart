import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/data/models/booking_model.dart';
import 'package:booking_app/features/home/cubit/app_cubit.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            backgroundColor:  OwnTheme.colorPalette['black'],
            appBar: AppBar(
              backgroundColor:  OwnTheme.colorPalette['black'],
              title:  Text(
                'my_trip'.tr(context),
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff282828),
                          border: Border.all(
                              color: const Color(0xff282828)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              cubit.toolbarSwitch(0);
                              cubit.toolbarColorSwitch(0);
                            },
                            child: Text(
                              'up_coming'.tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: cubit.count!=0? OwnTheme.colorPalette['white']:OwnTheme.colorPalette['primary'],
                                  fontWeight: FontWeight.w300,
                                  fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              cubit.toolbarSwitch(1);
                              cubit.toolbarColorSwitch(1);

                            },
                            child: Text(
                              'finished'.tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: cubit.toolbarColors[1]==false? OwnTheme.colorPalette['white']:OwnTheme.colorPalette['primary'],
                                  fontWeight: FontWeight.w300,
                                  fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              cubit.toolbarSwitch(2);
                              cubit.toolbarColorSwitch(2);
                            },
                            child: Text(
                              'favorites'.tr(context),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: cubit.toolbarColors[2]==false? OwnTheme.colorPalette['white']:OwnTheme.colorPalette['primary'],
                                  fontWeight: FontWeight.w300,
                                  fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*.04,),

                    if(cubit.count==2)
                    buildFavoritesWidget(size,context),

                    if(cubit.count==1)
                      AppCubit.get(context).bookingModelComplete!=null ?
                     AppCubit.get(context).bookingModelComplete!.data!.data!.isNotEmpty?
                      buildFinishedWidget(size,context,AppCubit.get(context).bookingModelComplete!):
                      Container(
                        color:  OwnTheme.colorPalette['black'],
                      ):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: OwnTheme.colorPalette['primary'],
                          )
                        ],
                      ),


                    if(cubit.count==0)
                    AppCubit.get(context).bookingModelUpcoming!=null?
                    buildUpComingWidget(context, size,AppCubit.get(context).bookingModelUpcoming!):
                   Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         CircularProgressIndicator(
                           color: OwnTheme.colorPalette['primary'],
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

  Widget buildFavoritesWidget(Size size,context){
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      SizedBox(
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
                      SizedBox(
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
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 10,);
        },
        itemCount: 10
    );
  }


  Widget buildFinishedWidget(Size size,context,BookingModel ?model){
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff282828),
                          border: Border.all(
                              color: const Color(0xff282828)
                          )
                      ),
                      child: Image(
                        image: NetworkImage(
                            'http://api.mahmoudtaha.com/images/${model!.data!.data![index].hotel!.hotelImages![0].image}'
                        ),
                        fit: BoxFit.cover,
                        width: size.width*.36,
                        height: size.height*.2,
                      ),
                    ),
                    SizedBox(width: size.width*.04,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              '${model.data!.data![index].hotel!.name}',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color:  OwnTheme.colorPalette['white'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Text(
                              '${model.data!.data![index].hotel!.address}',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color:  OwnTheme.colorPalette['gray'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${model.data!.data![index].hotel!.createdAt!.day}',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                ' Sep - ',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                '${model.data!.data![index].hotel!.updatedAt!.day}',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                ' Sep',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
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

                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height*.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color:  OwnTheme.colorPalette['primary'],
                                  size:  size.width*.06,
                                ),
                                SizedBox(width: size.width*.01,),
                                Text(
                                  '${model.data!.data![index].hotel!.rate}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${model.data!.data![index].hotel!.price}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
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


                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              '${model.data!.data![index+1].hotel!.name}',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color:  OwnTheme.colorPalette['white'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Text(
                              '${model.data!.data![index+1].hotel!.address}',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color:  OwnTheme.colorPalette['gray'],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${model.data!.data![index+1].hotel!.createdAt!.day}',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                ' Sep - ',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                '${model.data!.data![index+1].hotel!.updatedAt!.day}',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                              Text(
                                ' Sep',
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
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

                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height*.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color:  OwnTheme.colorPalette['primary'],
                                  size:  size.width*.06,
                                ),
                                SizedBox(width: size.width*.01,),
                                Text(
                                  '${model.data!.data![index+1].hotel!.rate}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${model.data!.data![index+1].hotel!.price}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
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


                        ],
                      ),
                    ),
                    SizedBox(width: size.width*.04,),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff282828),
                          border: Border.all(
                              color: const Color(0xff282828)
                          )
                      ),
                      child: Image(
                        image: NetworkImage(
                            'http://api.mahmoudtaha.com/images/${model.data!.data![index+1].hotel!.hotelImages![0].image}'
                        ),
                        fit: BoxFit.cover,
                        width: size.width*.36,
                        height: size.height*.2,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          );
        },
        separatorBuilder: (conext,index){
          return const SizedBox(width: 10,);
        },
        itemCount:model!.data!.data!.length-1
    );
  }

  Widget buildUpComingWidget(context , size,BookingModel model){

    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 10
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
            ),
            child: Column(
              children: [
                Text(
                  '${model.data!.data![index].createdAt}',
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
                            image:  NetworkImage(
                                'http://api.mahmoudtaha.com/images/${model.data!.data![index].hotel!.hotelImages![0].image}'
                            ),
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.height*.18,
                          ),
                          Positioned(
                            right: 10,
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
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                '${model.data!.data![index].hotel!.name}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                            ),
                            const SizedBox(width: 50,),
                            Text(
                              '\$${model.data!.data![index].hotel!.price}',
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
                        child:
                        Row(
                          children: [
                            Container(
                              child: Text(
                                '${model.data!.data![index].hotel!.address}',
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),
                            ),
                            const Spacer(),
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
                              size:  size.width*.07,
                            ),

                            SizedBox(width: size.width*.04,),
                            Text(
                               '${model.data!.data![index].hotel!.rate}',
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
          return const SizedBox(height: 10,);
        },
        itemCount: model.data!.data!.length
    );


  }
}
