import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/features/search_screen/view_search_result.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);


  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){

          Size size=MediaQuery.of(context).size;
          var cubit=AppCubit.get(context);

          return Scaffold(
            backgroundColor: Color(0xff1D1D1D),

            body: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          },
                          icon:  Icon(Icons.highlight_remove_outlined,color: OwnTheme.colorPalette['primary'],)
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          controller: searchController,
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
                                              color:  Color(0xff1D1D1D),
                                              size:  size.width*.00,
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
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  AppCubit.get(context).getSearchBooking(name: searchController.text).then((value) {
                                     Navigator.push(context, MaterialPageRoute(builder: (_){
                                         return const ViewSearchResult();
                                     }));
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff282828),
                                      border: Border.all(
                                          color: const Color(0xff282828)
                                      )                            ),
                                  child: Icon(
                                    Icons.search,
                                    color: OwnTheme.colorPalette['primary'],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),

                            ],
                          ),
                          SizedBox(height: size.height*.02,),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10
                            ),
                            width: double.infinity,
                            height: 150,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Container(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage('${cubit.searchNameImages[index]}'),
                                          radius: 45,
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '${cubit.searchNameTitles[index]}',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color:  OwnTheme.colorPalette['white'],
                                              fontWeight: FontWeight.w500,
                                              fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(width:10 ,);
                                },
                                itemCount: cubit.searchNameImages.length
                            ),
                          ),
                          SizedBox(height: size.height*.03,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Last Searches',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color:  OwnTheme.colorPalette['white'],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Clear all',
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
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 1/1.2,
                            mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                            children: List.generate(5, (index) => Container(
                              margin: EdgeInsets.all(10),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff282828),
                                  border: Border.all(
                                      color: const Color(0xff282828)
                                  )
                              ),
                              height: 180,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                     Image(
                                       fit: BoxFit.cover,
                                       height: 120,
                                       width: double.infinity,
                                       image: NetworkImage('${cubit.popularDestinationImages[index]}',
                                     )),
                                     SizedBox(height: 10,),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                         '${cubit.popularDestinationTitles[index]}',
                                         style: TextStyle(
                                         fontSize: 10.sp,
                                         color:  OwnTheme.colorPalette['white'],
                                         fontWeight: FontWeight.w500,
                                         fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                         ),
                                       ),
                                  ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        '1 Room , 3 People',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color:  OwnTheme.colorPalette['white'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        '1 Sep -  6 Sep',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color:  OwnTheme.colorPalette['white'],
                                            fontWeight: FontWeight.w500,
                                            fontFamily: lang == "ar" ? "fontAr" : "fontEn"
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )),
                          ),

                        ],
                      ),
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
