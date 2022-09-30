import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/features/profile/widgets/profile_info_card.dart';
import 'package:booking_app/features/profile/widgets/profile_list_tile.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';

class ProfileMainScreen extends StatefulWidget {
  ProfileMainScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  UserModel model = new UserModel();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['black'],
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            model != null
                ? ProfileInfoCard(
                    user: model,
                    onTap: () {
                      Navigator.pushNamed(context, '/profileDetails',
                              arguments: model)
                          .then((value) {
                        setState(() {});
                      });
                    },
                  )
                : Container(),
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
            ProfileListTile(
              text: 'logout_txt'.tr(context),
              icon: 'assets/icons/logout_icon.webp',
              onTap: () async {
                UserHelper db = UserHelper();
                db.deleteAll();
                addStringToSF('userID', '');
                addStringToSF('name', '');
                addStringToSF('userToken', '');
                Navigator.pushNamed(context, '/onboarding');
              },
            ),
            //
            // Container(
            //   width: 50,
            //   height: 50,
            //   color: Colors.red,
            //   child: IconButton(onPressed: (){
            //     DioHelper.updateProfile('sadasd', 'saas', 'sdsdsd');
            //   }, icon: Icon(Icons.ac_unit)),
            // )
          ],
        )).safeArea().wholePadding(),
      ),
    );
  }

  Future<void> getUserData() async {
    setState(() {
      isLoading = true;
    });

    UserHelper db = UserHelper();
    var user = await db.getAll();
    if (user.length > 0)
      setState(() {
        model = user.first;
      });
  }

}
