import 'package:booking_app/features/onboarding/pages/onboarding_screen.dart';

List<BoardingModel> boarding =[
  BoardingModel(
    image: 'assets/images/loading.json',
    title: 'Plan your trips',
    subtitle: 'Book one of your unique hotel to \n Escape the ordinary',


  ),
  BoardingModel(
      image: 'assets/images/travel.json',
      title: 'Find best deals',
      subtitle: 'Find deals for any season from cosy \n country homes to city flats'

  ),
  BoardingModel(
    image: 'assets/images/booking.json',
    title: 'Best travelling all time',
    subtitle: 'Find deals for any season from cosy \n country homes to city flats' ,

  ),


];

class BoardingModel {
  final String image;
  final  String title;
  final String subtitle;
  BoardingModel({
    required this.title, required this.subtitle,required this.image,
  });
}