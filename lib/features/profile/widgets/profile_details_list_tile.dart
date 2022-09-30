import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/TextBoxNormal.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';

class ProfileDetailsListTile extends StatelessWidget {
  String keyy = '';
  String value = '';
  bool editMode = false;
  Function(String val)? onChange;
  TextEditingController tec;

  ProfileDetailsListTile(
      {required this.keyy,
      required this.value,
      required this.editMode,
      this.onChange,
      required this.tec});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: space2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  keyy,
                  style: OwnTheme.smallTextStyle(lang: lang)
                      .colorChange(color: 'gray'),
                ),
              ),
              Expanded(
                flex: editMode ? 2 : 0,
                child: editMode
                    ? CustomTextBoxNormal(
                        lang: lang,
                        tec: tec,
                        onChange: onChange,
                      )
                    : Text(
                        value,
                        style: OwnTheme.smallBoldTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                      ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 0.5,
                      color: OwnTheme.colorPalette['gray']!,
                      style: BorderStyle.solid))),
        ),
      ],
    );
  }
}
