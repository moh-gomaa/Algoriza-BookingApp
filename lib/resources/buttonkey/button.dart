import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ButtonKey extends StatelessWidget {
  final Function()? function;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Color? textColor, backgroundColor;
  final double radius;

  const ButtonKey({
    Key? key,
    this.function,
    this.buttonText,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.radius = round,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function != null ? function!() : null;
      },
      child: Container(
        padding: padding ?? EdgeInsets.only( bottom: 8, top: 5),
        decoration: BoxDecoration(
            color: backgroundColor ?? OwnTheme.colorPalette['primary'],
            borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: Text(
            '${buttonText}',
            style: OwnTheme.suitableTextStyle(lang: lang)
                .copyWith(color: textColor ?? OwnTheme.colorPalette['white']),
          ),
        ),
      ),
    );
  }
}
