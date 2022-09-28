import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/features/profile/bloc/profile_cubit.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';

import '../widgets/profile_details_list_tile.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final UserModel user;

  ProfileDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('naem==${user.name}');
    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['black'],
      body: Column(
        children: [
          CustomAppBar(
            lang: lang,
            leadingWidget: BackIconAppBar(
              lang: lang,
            ),
            actionWidget: ButtonKey(
              buttonText: 'edit_btn'.tr(context),
              function: () {

              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                bottom: bottom, right: side, left: side),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                debugPrint('state==$state');
                return Column(
                  children: [
                    ProfileDetailsListTile(
                      keyy: 'user_name_txt'.tr(context),
                      value: '${user.name}',
                      // editMode: (state is ProfileEditState),
                    ),
                    ProfileDetailsListTile(
                      keyy: 'email_txt'.tr(context),
                      value: '${user.email}',
                      // editMode: (state is ProfileEditState),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
