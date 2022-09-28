import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? leadingWidget;
  final Widget? centerWidget;
  final Widget? actionWidget;
  final String? lang;
  final bool? hasTitle;
  final EdgeInsets? custom_padding;

  CustomAppBar({
    this.title,
    this.leadingWidget,
    this.actionWidget,
    this.lang,
    this.centerWidget,
    this.hasTitle,
    this.custom_padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: custom_padding ??
            EdgeInsets.only(
                top: top ,
                bottom: space0,
                right: side,
                left: side),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingWidget ?? Container(),
                title != null
                    ? Text(title!)
                    : centerWidget != null
                        ? centerWidget!
                        : Container(),
                actionWidget ?? Container(),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class BackIconAppBar extends StatelessWidget {
  final String? lang;

  const BackIconAppBar({Key? key, this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding:  EdgeInsets.only(top: space1, bottom: space1,
          left:lang == null ?0 :lang=='ar' ?0.0  :space0,
          right:lang == null ?0 :lang=='en' ?space0  :0,
        ),
        child: Image.asset(
          lang == 'en'
              ? 'assets/icons/back_en.webp'
              : 'assets/icons/back_ar.webp',
          width: 20.sp,
          height: 20.sp,
          color: OwnTheme.colorPalette['white'],
        ),
      ),
    );
  }
}

