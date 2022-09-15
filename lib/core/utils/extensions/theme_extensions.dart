import 'package:flutter/material.dart';
import 'package:booking_app/resources/themes/theme.dart';

extension ThemeX on TextStyle {
  TextStyle colorChange({required String color}) {
    switch (color) {
      case 'primary':
        return this.copyWith(color: OwnTheme.colorPalette['primary']);
      case 'secondary':
        return this.copyWith(color: OwnTheme.colorPalette['secondary']);
      case 'white':
        return this.copyWith(color: OwnTheme.colorPalette['white']);
      case 'gray':
        return this.copyWith(color: OwnTheme.colorPalette['disable']);
      default:
        return this.copyWith(color: OwnTheme.colorPalette['black']);
    }
  }
}
