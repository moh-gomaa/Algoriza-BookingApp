import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:lottie/lottie.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gradient_bg.webp'),
                fit: BoxFit.cover)),
        child: Lottie.asset('assets/images/no_internet.json',
            width: MediaQuery.of(context).size.width * 0.8),
      ),
    );
  }
}
