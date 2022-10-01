
import 'package:bloc/bloc.dart';
import 'package:booking_app/core/utils/local/cash_helper.dart';
import 'package:booking_app/core/utils/network/remote/dio.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/core/utils/widgets/toast.dart';
import 'package:booking_app/data/models/booking_model.dart';
import 'package:booking_app/data/models/explore_model.dart';
import 'package:booking_app/features/home/cubit/app_states.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int count = 0;

  List toolbarColors = List.generate(3, (index) => false);

  List homeImages = [
    'assets/images/homeImage2.jpg',
    'assets/images/homeImage1.jpeg',
    'assets/images/homeImage3.jpg',
  ];

  List popularDestinationImages = [
    'https://img.freepik.com/free-photo/beautiful-wide-shot-eiffel-tower-paris-surrounded-by-water-with-ships-colorful-sky_181624-5118.jpg?w=740&t=st=1664431255~exp=1664431855~hmac=08abca3e8538dbb8ec84b53425e674ffcd9e03180e1354ec9912c03e955c2652',
    'https://img.freepik.com/free-photo/big-ben-westminster-bridge-sunset-london-uk_268835-1395.jpg?w=740&t=st=1664431098~exp=1664431698~hmac=6ba785838a7b54137b2dfad0a46ef13ceb361c458ef19cdebe2cc69bb19fc3ed',
    'https://img.freepik.com/free-photo/skyscrapers-palm-trees-dubai-uae_268835-1062.jpg?w=740&t=st=1664431122~exp=1664431722~hmac=b1a857af8863fa77727c964a6bcf22c83212112d9310158c43effb3dc8fb664f',
    'https://img.freepik.com/free-photo/plaza-de-cibeles-summer-dusk-madrid_1398-4150.jpg?w=740&t=st=1664431148~exp=1664431748~hmac=5b33f518cb4f7097efb65c8f7f8ff7a34890ef254c7f50d5a5276bbd653e8b2d',
    'https://img.freepik.com/free-photo/beautiful-shot-famous-roman-colosseum-amphitheater-breathtaking-sky-sunrise_181624-6998.jpg?w=740&t=st=1664431182~exp=1664431782~hmac=a2451cb16c9a2a5058f00b8c9b79ab294a45d3315e532ab320be14bd2a46fafa',
  ];

  List popularDestinationTitles = [
    'Paris',
    'London',
    'Dubai',
    'Madrid',
    'Roma',
  ];

  List deluxeRoomImages = [
    'https://d2e5ushqwiltxm.cloudfront.net/wp-content/uploads/sites/125/2017/05/25035156/Rooms-Suites-Section-1st-Room-Superior-Room1.jpg',
    'https://cloudstorage.mosaic-collection.com/property/loeipalace/hotel-photos/accommodation/deluxe/deluxe_king-1.jpg',
    'https://d2e5ushqwiltxm.cloudfront.net/wp-content/uploads/sites/125/2017/05/25023446/Rooms-Suites-Section-2nd-Room-Deluxe-Room.jpg',
  ];


  List premiumRoomImages = [
    'https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j8_rokge_03_p_1024x768.jpg?ritok=61&twic=v1/cover=800x600',
    'https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j8_rokge_00_p_1024x768.jpg?ritok=61&twic=v1/cover=800x600',
    'https://mmf5angy.twic.pics/ahstatic/www.ahstatic.com/photos/b1j8_rokge_02_p_1024x768.jpg?ritok=61&twic=v1/cover=800x600'
  ];


  List queenRoomImages = [
    'https://cdn.traveltripper.io/site-assets/512_855_12327/media/2018-02-27-075626/large_executive-queen.jpg',
    'https://webbox.imgix.net/images/otdustgzhfifjutp/c4d583ed-177b-404d-a350-1d4eadbd57a2.jpg?auto=format,compress&fit=crop&crop=entropy',
    'https://sierrahotel.ph/v2/wp-content/uploads/room-queenroom.jpg'
  ];

  List kingRoomImages = [
    'https://vwartclub.com/media/projects/5930/1.jpg',
    'https://vwartclub.com/media/projects/5930/2.jpg',
    'https://vwartclub.com/media/projects/3969/1.jpg'
  ];

  List hollywoodRoomImages = [
    'https://www.machiya-inn-japan.com/kyoto/shinsen-en/wp-content/themes/shinsenen/asset/images/rooms/chtr/main.jpg',
    'https://www.machiya-inn-japan.com/kyoto/shinsen-en/wp-content/themes/shinsenen/asset/images/rooms/chtr/gallery_img02.jpg',
    'https://www.machiya-inn-japan.com/kyoto/shinsen-en/wp-content/themes/shinsenen/asset/images/rooms/chtr/gallery_img03.jpg'
  ];



  List searchNameTitles = [
    'Hotel',
    'BackPacker',
    'Resort',
    'Villa',
    'Apartment',
    'Guest House',
    'Motel',
     ];

  List searchNameImages = [
    'https://img.freepik.com/free-photo/beautiful-luxury-outdoor-swimming-pool-hotel-resort_74190-7433.jpg?w=740&t=st=1664634799~exp=1664635399~hmac=09385039b188b3f8e4da8dcdba210e1a967fabdde0fdc1de2a997d221df136cd',
    'https://img.freepik.com/premium-photo/modern-minimalist-interior-living-room_33739-472.jpg?w=900',
    'https://img.freepik.com/free-photo/swimming-pool_74190-2104.jpg?w=740&t=st=1664634862~exp=1664635462~hmac=b42e503f5fb859c7bc093baded2cd6ab17f3c298155a6210b7a60fc8e0b5f784',
    'https://img.freepik.com/free-photo/solar-panels-roof-modern-house-harvesting-renewable-energy-with-solar-cell-panels-exterior-design-3d-rendering_41470-3654.jpg?w=900&t=st=1664634886~exp=1664635486~hmac=f57755a83d7a6ec56f099b650330aa5c69ec18190ac679c9cfeb07946e3c4f94',
    'https://img.freepik.com/free-photo/modern-residential-building_1268-14735.jpg?w=740&t=st=1664634907~exp=1664635507~hmac=528035cf26bd41d335e7e2a6335682e5808633672c9d2c2e04c774f9d0d9ba0a',
    'https://img.freepik.com/free-photo/house-isolated-field_1303-23773.jpg?w=740&t=st=1664634944~exp=1664635544~hmac=31f39d2220f5f6cb44039bcd85fc397c3de9b6be245308a99c87e8d9d9c40d84',
    'https://img.freepik.com/premium-photo/interior-design-modern-studio-apartment_493343-26479.jpg?w=740',
  ];

  void toolbarColorSwitch(index) {
    toolbarColors = List.generate(3, (index) => false);
    toolbarColors[index] = !toolbarColors[index];
    emit(ToolBarSwitchSuccess());
  }

  void toolbarSwitch(int value) {
    count = value;
    if(count ==0){
      getBookingUpcoming(
        token: CashHelper.getData(key: 'token'),
      );
    }
    else if(count ==1){
      getBookingComplete(
        token: CashHelper.getData(key: 'token'),
      );
    }
    emit(ToolBarSwitchSuccess());
  }


  ExploreModel ?exploreModel;

  Future<void> getExplore() async {
    print('//////////////////////////////////');

    await DioHelper2.getData(
        url: '/hotels',
        query: {
          'count': 10,
          'page': 1
        }
    ).then((value) {
      print('//////////////////////////////////');
      print(value.data.toString());
      exploreModel = ExploreModel.fromJson(value.data);
      emit(ToolBarSwitchSuccess());
      print('//////////////////////////////////');
    }).catchError((error) {
      print('Error in get explore is ${error.toString()}');
      emit(ToolBarSwitchSuccess());
    });

  }

  Future<void> createBook({
    required int userId,
    required int hotelId,
    required String token,
  }) async {
    await DioHelper2.postData(
      token: '${token}',
      url: '/create-booking',
      data: {
        "user_id": 15,
        "hotel_id": 21
      },
    ).then((value) {
      print('//////////////////////////////////');
      print(value.data.toString());
      customToast(
          title: lang == "ar" ?value.data['status']['title']['ar']: value.data['status']['title']['en'],
          color: OwnTheme.colorPalette['primary']!
      );
      emit(CreateBookingSuccessState());
      print('//////////////////////////////////');
    }).catchError((error) {
      print('Error in create booking is ${error.toString()}');
      emit(CreateBookingErrorState());
    });
  }

  BookingModel ?bookingModelUpcoming;

  Future<void> getBookingUpcoming({
    required String token
   }) async {

    await DioHelper2.getData(
        token: '${token}',
        url: '/get-bookings',
        query: {
          'type': 'upcomming',
          'count': 10
        }
    ).then((value) {

      print(value.data.toString());
      bookingModelUpcoming = BookingModel.fromJson(value.data);
      emit(GetBookingUpComingSuccessState());
      print('//////////////////////////////////');
    }).catchError((error) {
      print('Error in get booking upcoming is ${error.toString()}');
      emit(GetBookingUpComingErrorState());
    });

  }


  BookingModel ?bookingModelComplete;

  Future<void> getBookingComplete({
    required String token
  }) async {

    await DioHelper2.getData(
        token: '${token}',
        url: '/get-bookings',
        query: {
          'type': 'completed',
          'count': 10
        }
    ).then((value) {

      print(value.data.toString());
      bookingModelComplete = BookingModel.fromJson(value.data);
      emit(GetBookingCompletedSuccessState());
      print('//////////////////////////////////');
    }).catchError((error) {
      print('Error in get booking completed is ${error.toString()}');
      emit(GetBookingCompletedErrorState());
    });

  }


  Database ?database;
  String time='${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}';
  List <Map>  allFavorite=[];


  void createDatabase() async {

    return await openDatabase(
        'favorite.db',
        version: 1,
        onCreate: (database,version){
          database.execute(
              'CREATE TABLE favorite (id INTEGER PRIMARY KEY , name TEXT , address TEXT, price TEXT, rate TEXT, image TEXT, favorite TEXT)'
          ).then((value) {
            print('Table Created');
            emit(CreateTableState());
          });
        },
        onOpen: (database){

          getDatabase(database).then((value){
            allFavorite=value;
          }).catchError((error){
            print('error i ${error.toString()}');
          });
          print('Database Opened');
        }

    ).then((value) {
      database=value;
      print('Database Created');
      emit(CreateDatabaseSuccessState());
    }).catchError((error){
      print('error is ${error.toString()}');
      emit(CreateDatabaseErrorState());

    });
  }

  Future insertDatabase(
      {
        required String name,
        required String address,
        required String price,
        required String rate,
        required String image,
      }) async{

    return database?.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO favorite (name,address,price,rate,image,favorite) VALUES ( "${name}" , "${address}" , "${price}" , "${rate}" , "${image}" , "yes")'
      ).then((value) {
        print("${value} Insert Success");
        emit(InsertDatabaseSuccessState());
        getDatabase(database).then((value){
          allFavorite=value;
        });
        customToast(title: 'Hotel add to favorite', color: OwnTheme.colorPalette['primary']!);
        emit(InsertDatabaseSuccessState());

      }).catchError((error){
        print('Error is ${error.toString()}');
      });

    });

  }


  Future <List<Map>> getDatabase(database)async {

    allFavorite=[];


    return await database?.rawQuery(
        'SELECT * FROM favorite'
    ).then((value) {
      print(value[0]['color']);
      print(value[0]['deadline']);
      print(time);


      value.forEach((element){




        if(element['favorite']=='yes')
        {
          print('Here');
          allFavorite.add(element);

        }


      });

      print(allFavorite);
      emit(GetDatabaseSuccessState());
    }).catchError((error){
      print('GetError is ${error.toString()}');
    });
  }


  // void updateFavorite(
  //     {
  //       required String F,
  //       required int id,
  //     }
  //     ) async{
  //
  //   database?.rawUpdate(
  //
  //       'UPDATE todo SET favorite = ? WHERE id = ?',
  //       ['$F', '$id']).then((value) {
  //     print('Update Done');
  //     getDatabase(database);
  //     emit(UpdateFavoriteSuccessState());
  //   }).catchError((error){
  //     print('error is ${error.toString()}');
  //   });
  //
  // }
  //
  //
  // void deleteDatabase(
  //     {
  //       required int id,
  //     }
  //     ) async{
  //
  //   database?.rawDelete(
  //       'DELETE FROM todo WHERE id = ?', ['$id'])
  //       .then((value) {
  //     getDatabase(database);
  //     emit(DeleteDatabaseSuccessState());
  //   }).catchError((error){
  //     print('error is ${error.toString()}');
  //   });
  //
  // }



}