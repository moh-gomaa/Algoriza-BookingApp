
import 'package:flutter/material.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';

extension WidgetX on Widget {

  Widget sectionFill() => Container(
    decoration: BoxDecoration(
        color: OwnTheme.colorPalette['primary']!.withOpacity(0.7),
        borderRadius: BorderRadius.circular(round)),
    child: Padding(
      padding: const EdgeInsets.all(space1),
      child: this,
    ),
  );


}

