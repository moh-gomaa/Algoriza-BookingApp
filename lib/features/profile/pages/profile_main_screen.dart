import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/features/profile/bloc/profile_cubit.dart';
import 'package:booking_app/features/profile/widgets/profile_info_card.dart';
import 'package:booking_app/features/profile/widgets/profile_list_tile.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';

class ProfileMainScreen extends StatelessWidget {
  ProfileMainScreen({Key? key}) : super(key: key);

  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['black'],
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ProfileCubit()..getUserData(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                return Container(
                    child: Column(
                  children: [
                    ProfileInfoCard(user: state.model),
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
                        Navigator.pushNamed(context, '/setting');
                      },
                    ),
                  ],
                ));
              }
              return Container();
            },
          ),
        ).safeArea().wholePadding(),
      ),
    );
  }
}

class ProfileItem {
  final String? name;
  final String? imgPath;

  ProfileItem(this.name, this.imgPath);
}
