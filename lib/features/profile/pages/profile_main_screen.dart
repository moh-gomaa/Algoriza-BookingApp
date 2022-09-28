import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/features/profile/widgets/profile_info_card.dart';
import 'package:booking_app/features/profile/widgets/profile_list_tile.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:sizer/sizer.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileItem x =
        ProfileItem('Ahmed Mohamed', 'assets/icons/group_icon.webp');

    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['black'],
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            ProfileInfoCard(user: x),
            const SizedBox(
              height: space2,
            ),
            ProfileListTile(
              text: 'change_pass_txt'.tr(context),
              icon: 'assets/icons/lock_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
            ProfileListTile(
              text: 'invite_friend_txt'.tr(context),
              icon: 'assets/icons/group_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
            ProfileListTile(
              text: 'credit_coupons_txt'.tr(context),
              icon: 'assets/icons/prize_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
            ProfileListTile(
              text: 'help_center_txt'.tr(context),
              icon: 'assets/icons/info_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
            ProfileListTile(
              text: 'payment_txt'.tr(context),
              icon: 'assets/icons/wallet_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
            ProfileListTile(
              text: 'setting_txt'.tr(context),
              icon: 'assets/icons/setting_icon.webp',
              onTap: () {
                debugPrint('tap');
              },
            ),
          ],
        )).safeArea().wholePadding(),
      ),
    );
  }
}

class ProfileItem {
  final String? name;
  final String? imgPath;

  ProfileItem(this.name, this.imgPath);
}
