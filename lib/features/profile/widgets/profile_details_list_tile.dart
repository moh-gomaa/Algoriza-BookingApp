import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/TextBoxNormal.dart';
import 'package:booking_app/features/profile/bloc/profile_cubit.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';

class ProfileDetailsListTile extends StatelessWidget {
  String keyy = '';
  String value = '';
  bool editMode = false;

  ProfileDetailsListTile({
    required this.keyy, required this.value,required this.editMode
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('editMode==$editMode');
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
                  style:
                  OwnTheme.smallTextStyle(lang: lang).colorChange(color: 'gray'),
                ),
              ),
              Expanded(
                flex: 2,
                child: editMode?
                    CustomTextBoxNormal(
                      lang: lang,
                      title: 'rrr',
                      tec: ProfileCubit().name,
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

        ElevatedButton(onPressed: (){
          debugPrint('value==${ProfileCubit().name.text}');

        }, child: Text('asddsa'))
      ],
    );
  }
}
