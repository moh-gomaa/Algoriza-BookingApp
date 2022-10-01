import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/data/models/explore_model.dart';
import 'package:booking_app/features/book_hotel.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatefulWidget {
   ExploreScreen({Key? key}) : super(key: key);
  var searchController=TextEditingController();
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          var cubit=AppCubit.get(context);
          return  cubit.exploreModel!=null?
          Scaffold(
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
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: (){},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.map_outlined,
                    color: Colors.white,
                  ),
                  onPressed: (){},
                ),

              ],
              backgroundColor: Color(0xff191919),
              title:  Text(
                'explore'.tr(context),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      padding: EdgeInsets.all(10),
                      height: size.height*.11,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: widget.searchController,
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

                                hintStyle: TextStyle(
                                    fontSize: 11.sp,
                                    color:  Colors.grey[100],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                                hintText: 'London..',
                                filled: true,
                                fillColor: const Color(0xff282828),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color(0xff191919),
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Color(0xff191919),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              AppCubit.get(context).getSearchBooking(name: widget.searchController.text);
                            },
                            child: CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      // margin: const EdgeInsets.symmetric(
                      //   horizontal: 10,
                      //   vertical: 10
                      // ),
                      padding: EdgeInsets.all(10),
                      height: size.height*.11,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'choose_date'.tr(context),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color:  Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "fontEnBold"
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '27, Sep - 02, Oct',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color:  Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "fontEnBold"
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 1,
                            height: 60,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'number_of_rooms'.tr(context),
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color:  Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "fontEn"
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    '1 Room 2 People',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color:  Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "fontEnBold"
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${AppCubit.get(context).exploreModel!.data!.total}',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color:  Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "fontEnBold"
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            'hotel_found'.tr(context),
                            style: TextStyle(
                                fontSize: 11.sp,
                                color:  Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "fontEnBold"
                            ),
                          ),
                          Spacer(),
                          Text(
                            'filter'.tr(context),
                            style: TextStyle(
                                fontSize: 10.sp,
                                color:  Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "fontEnBold"
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.sort,
                              color: OwnTheme.colorPalette['primary'],
                            ),
                            onPressed: (){

                            },
                          ),
                        ],
                      ),
                    ),

                    buildUpComingWidget(context , size,cubit.exploreModel!)
                  ],
                ),
              ),
            ),
          ):
              Center(
                child: CircularProgressIndicator(
                  color: OwnTheme.colorPalette['primary'],
                ),
              );
      },
    );
  }

  Widget buildUpComingWidget(context , size , ExploreModel model){

    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              print('sssssssssssi');
              print(model.data!.data![index].id);
              Navigator.push(context, MaterialPageRoute(builder: (_){
                 return BookHotel(
                   hotelName: (model.data!.data![index].name)!,
                   hotelId: (model.data!.data![index].id)!,
                 );
              }));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
              ),
              child: Column(
                children: [
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
                              image: NetworkImage(
                                  'http://api.mahmoudtaha.com/images/${model.data!.data![index].hotelImages![0].image}'
                              ),
                              fit: BoxFit.cover,
                              width: size.width,
                              height: size.height*.18,
                            ),
                            Positioned(
                              right: 10,
                              child: IconButton(
                                icon:  CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Color(0xff282828),
                                  child: AppCubit.get(context).exploreValues[index]==false? Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: OwnTheme.colorPalette['primary'],
                                  ):Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: OwnTheme.colorPalette['primary'],
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    AppCubit.get(context).exploreValues[index] =!AppCubit.get(context).exploreValues[index];

                                  });
                                  AppCubit.get(context).insertDatabase(
                                      name: '${model.data!.data![index].name}',
                                      address: '${model.data!.data![index].address}',
                                      price: '${model.data!.data![index].price}',
                                      rate: '${model.data!.data![index].rate}',
                                      image: '${model.data!.data![index].hotelImages![0].image}'
                                  );
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
                                width: 230,
                                child: Text(
                                  '${model.data!.data![index].name}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width*.04,),
                              Text(
                                '\$${model.data!.data![index].price}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color:  OwnTheme.colorPalette['white'],
                                    fontWeight: FontWeight.w500,
                                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  '${model.data!.data![index].address}',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"
                                  ),
                                  overflow: TextOverflow.ellipsis,

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
                              const Spacer(),
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
                                size:  size.width*.06,
                              ),
                              SizedBox(width: size.width*.02,),
                              Text(
                                '${model.data!.data![index].rate}',
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

                      ],
                    ),
                  )

                ],
              ),
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
