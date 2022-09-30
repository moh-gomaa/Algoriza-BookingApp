import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/features/get_started/widgets/app_basic_info.dart';
import 'package:booking_app/features/get_started/widgets/bottom_controller.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/get_started_bg.webp'))),
            child: Column(
              children: [
                AppBasicInfo(),
                Spacer(),
                BottomController()
              ],
            ).safeArea().wholePadding(),
          ),
        ),
      ),
    );
  }
}
