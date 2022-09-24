import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileListTile extends StatelessWidget {
  final String? text;
  final dynamic? icon;
  final Color? iconColor;
  final Function? onTap;

  const ProfileListTile({this.text, this.icon, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap != null ? onTap!() :null;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: space2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text ?? '',
              style: OwnTheme.normalTextStyle(lang: lang)
                  .colorChange(color: 'white'),
            ),
            if (icon is IconData)
              Icon(
                icon,
                color: iconColor ?? OwnTheme.colorPalette['gray'],
                size: 20.sp,
              ),
            if (icon is String)
              Image.asset(
                icon.toString(),
                width: 20.sp,
                height: 20.sp,
                color: iconColor ?? OwnTheme.colorPalette['gray'],
              )
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5,
                    color: OwnTheme.colorPalette['gray']!,
                    style: BorderStyle.solid))),
      ),
    );
  }
}
