import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel user;

  const ProfileInfoCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushNamed(context, '/profileDetails', arguments: user);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name!.split(' ').first}',
                style: OwnTheme.suitableBoldTextStyle(lang: lang)
                    .colorChange(color: 'white'),
              ),
              Text(
                'view_edit_profile_txt'.tr(context),
                style: OwnTheme.normalBoldTextStyle(lang: lang)
                    .colorChange(color: 'gray'),
              )
            ],
          ),
          user.image != null
              ? Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: OwnTheme.colorPalette['gray']),
                  child: Padding(
                      padding: const EdgeInsets.all(space0),
                      child: Image.asset(
                        '${user.image}',
                        width: 30.sp,
                        height: 30.sp,
                      )),
                )
              : Container(),
        ],
      ),
    );
  }
}
