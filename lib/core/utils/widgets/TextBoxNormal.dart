// index 0 string
// index 1 number
// index 2 mail
// index 3 password

import 'package:booking_app/features/profile/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';


class CustomTextBoxNormal extends StatefulWidget {
  final String? hint;
  final String? title;
  final String? value;
  final TextEditingController? tec;
  final int? index;
  final String? lang;
  final Widget? prefix;
  final Widget? suffix;
  final bool? requerd;
  final int? maxChar;
  final String? changeAlignmet;
  Function(String val)? onChange;
  final bool? keyboardPadding;
  final bool countryPicker;

  CustomTextBoxNormal({
    this.hint,
    this.title,
    this.value,
    this.tec,
    this.index,
    this.lang,
    this.prefix,
    this.suffix,
    this.requerd,
    this.onChange,
    this.maxChar,
    this.changeAlignmet,
    this.keyboardPadding,
    this.countryPicker = false,
  });

  @override
  _CustomTextBoxNormalState createState() => _CustomTextBoxNormalState();
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern as String);
  return (!regex.hasMatch(value)) ? false : true;
}

class _CustomTextBoxNormalState extends State<CustomTextBoxNormal> {
  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? '',
          style: OwnTheme.normalBoldTextStyle( lang: lang),
        ),
        SizedBox(
          height: space1,
        ),
        TextFormField(
          scrollPadding: widget.keyboardPadding != null
              ? widget.keyboardPadding!
                  ? EdgeInsets.only(
                      bottom: bottomInsets + height1 * 2)
                  : EdgeInsets.only(bottom: bottomInsets)
              : EdgeInsets.only(bottom: bottomInsets),
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxChar)
          ],
          obscureText: widget.index == 3 ? true : false,
          controller: widget.tec,
          keyboardType: widget.index == 1 || widget.index == 4
              ? TextInputType.numberWithOptions()
              : TextInputType.text,
          onChanged: (val) {
            ProfileCubit().name.text = val;
            // widget.tec!.text = val;
            // if(widget.onChange != null){
            //   widget.onChange!(val);
            //
            // }
          },
          style: OwnTheme.normalBoldTextStyle( lang: lang),
          decoration: InputDecoration(
              //Good in space but not at all
              // prefix: widget.prefix != null ? widget.prefix : null,
              // suffix:widget.suffix != null ? widget.suffix :null ,

              suffixIcon:
                  widget.suffix != null ? widget.suffix : null,
              prefixIcon:
                  widget.prefix != null ? widget.prefix : null,
              prefixStyle:OwnTheme.normalBoldTextStyle( lang: lang).colorChange(color: 'secondary'),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(round),
                ),
              ),
              fillColor: OwnTheme.colorPalette['lightGray'],
              filled: true,
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //       width: 1.0,
              //       color: OwnTheme.colorPalette['gray']!),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //       width: 1.0,
              //       color: OwnTheme.colorPalette['primary']!),
              // ),
              // errorBorder: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(round),
              //   ),
              // ),
              contentPadding: EdgeInsets.all(space2),
              errorStyle: OwnTheme.normalBoldTextStyle( lang: lang).colorChange(color: 'secondary'),
              hintText: widget.hint,
              hintStyle: OwnTheme.normalBoldTextStyle( lang: lang).colorChange(color: 'gray')),
          textAlign: widget.changeAlignmet == 'center'
              ? TextAlign.center
              : widget.changeAlignmet == '' ||
                      widget.changeAlignmet == null
                  ? widget.lang == 'en'
                      ? TextAlign.left
                      : TextAlign.right
                  : widget.changeAlignmet == 'ar'
                      ? TextAlign.right
                      : TextAlign.left,
          textDirection: widget.changeAlignmet != '' ||
                  widget.changeAlignmet != null
              ? widget.changeAlignmet == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr
              : widget.lang == 'en'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
        ),
        SizedBox(
          height: space1,
        )
      ],
    );
  }
}
