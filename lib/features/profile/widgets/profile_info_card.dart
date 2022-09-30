import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserModel user;
  final Function onTap;

  const ProfileInfoCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
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
                      child:
                      CachedNetworkImage(
                        imageUrl: user.image!,
                        placeholder: (context, url) => Center(
                            child: Container(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) => Container(
                          width: 50,
                          height: 50,
                        ),
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
