import 'dart:io';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/data/models/basic_model.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/profile_details_list_tile.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final UserModel user;

  ProfileDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool editMode = false;
  bool isLoading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      name.text = widget.user.name!;
      email.text = widget.user.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OwnTheme.colorPalette['black'],
        body: Column(children: [
          CustomAppBar(
              lang: lang,
              leadingWidget: BackIconAppBar(
                lang: lang,
              ),
              actionWidget: ButtonKey(
                isLoading: isLoading,
                buttonText:
                    (editMode) ? 'saveBtn'.tr(context) : 'edit_btn'.tr(context),
                function: () {
                  if (editMode) {
                    setState(() {
                      editMode = false;
                    });
                    // saveProfile();
                  } else {
                    setState(() {
                      editMode = true;
                    });
                  }
                },
              )),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  // xx();
                  getImageFromGallery();
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/page_start.png')
                    // Image.asset('assets/Images/account/camera.png'),
                    ),
              ),
              ProfileDetailsListTile(
                keyy: 'user_name_txt'.tr(context),
                value: '${widget.user.name}',
                editMode: editMode,
                tec: name,
              ),
              ProfileDetailsListTile(
                keyy: 'email_txt'.tr(context),
                value: '${widget.user.email}',
                editMode: editMode,
                tec: email,
              ),
            ],
          )
        ]));
  }

  // saveProfile() async {
  //   setState(() {
  //     isLoading = true;
  //     widget.user.name = name.text;
  //     widget.user.email = email.text;
  //   });
  //   UserModel tmp = UserModel(
  //       name: name.text, email: email.text, id: int.parse(BasicModel.userID));
  //   UserHelper db = UserHelper();
  //   await db.update(tmp);
  //
  //   var res = await DioHelper.post('auth/update-info',
  //       headers: {"token": '${BasicModel.userToken}'},
  //       body: {"name": "${name.text}", "email": "${email.text}"});
  //
  //   if (res != false) {
  //     UserModel row = UserModel.fromJson(res['data']);
  //     context.read<ProfileCubit>().emitSucess(row);
  //   }
  //
  //
  // }

  File? file;

  Future getImageFromGallery() async {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width * 0.50;

    var image = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 500.0, maxHeight: 300.0);
    if (image != null) {
      file = File(image.path);

      var x = await updateProfile(img: file!.path);
      print('ress=');
      print(x);
    }
  }

  Future<dynamic> updateProfile({String? img}) async {
    setState(() {
      isLoading = true;
      widget.user.name = name.text;
      widget.user.email = email.text;
    });

    var headers = {'token': '${BasicModel.userToken}'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}auth/update-info'));
    request.fields.addAll({'name': '$name', 'email': '$email'});

    debugPrint('url==${baseUrl}auth/update-info');

    if (img != null)
      request.files.add(await http.MultipartFile.fromPath('image', '$img'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint('Error');
      debugPrint(response.reasonPhrase);
    }
    setState(() {
      isLoading = false;
    });
  }

// Future xx() async {
//   var headers = {
//     'token': 'DGF3zzM5ZDt7p8lC2fpjnHFNeizqv8iZbKSymRxf3F388eFzKNYyNuTMAXDg'
//   };
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://api.mahmoudtaha.com/api/auth/update-info'));
//   request.fields
//       .addAll({'name': 'Mohamed Gomaa', 'email': 'moh.adel68@gmail.com'});
//   request.files.add(await http.MultipartFile.fromPath('image',
//       '/Users/smarthrd/Desktop/training/algoriza/task_2_Todo/app/todo_app/assets/images/logo_animated.gif'));
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }
}
