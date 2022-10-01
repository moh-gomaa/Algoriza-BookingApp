import 'dart:io';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:booking_app/data/database/user_helper.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';

import '../widgets/profile_details_list_tile.dart';

class ProfileDetailsScreen extends StatefulWidget {
  late UserModel user;

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
    getProfileDateLocal();
  }

  getProfileDate() async {
    var resultJson = await DioHelper.get('auth/profile-info',
        headers: {'token': BasicModel.userToken});
    print(resultJson);
    if (resultJson != false) {
      UserModel tmp = UserModel.fromJson(resultJson['data']);
      setState(() {
        widget.user = tmp;
        BasicModel.userImage = tmp.image!;
      });

      ProfileSaveLocal();
    }
  }

  ProfileSaveLocal() async {
    UserHelper db = UserHelper();
    await db.deleteAll();
    await db.savePost(widget.user);
  }

  Future<void> getProfileDateLocal() async {
    UserHelper db = UserHelper();
    var tmp = await db.getAll();
    if (tmp.length == 0) {
      getProfileDate();
    } else {
      setState(() {
        widget.user = tmp.first;
      });
      getProfileDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: OwnTheme.colorPalette['black'],
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                  lang: lang,
                  leadingWidget: BackIconAppBar(
                    lang: lang,
                  ),
                  actionWidget: ButtonKey(
                    isLoading: isLoading,
                    buttonText: (editMode)
                        ? 'saveBtn'.tr(context)
                        : 'edit_btn'.tr(context),
                    function: () async {
                      if (editMode) {
                        setState(() {
                          editMode = false;
                        });
                        updateProfile();
                      } else {
                        setState(() {
                          editMode = true;
                        });
                      }
                    },
                  )).safeArea(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      editMode ? selectImageFrom(context) : null;
                    },
                    child: CachedNetworkImage(
                      imageUrl: BasicModel.userImage,
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
                  SizedBox(
                    height: space2,
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
              ).wholePadding(),
            ],
          ),
        ));
  }

  void selectImageFrom(BuildContext ctx) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(2 * round))),
        backgroundColor: OwnTheme.colorPalette['bgGray'],
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        builder: (ctx) => Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 8,
                        decoration: BoxDecoration(
                            color: OwnTheme.colorPalette['primary'],
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: side,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('choose_img_desc'.tr(ctx),
                          style: OwnTheme.suitableBoldTextStyle(lang: lang)
                              .colorChange(color: 'white')),
                    ],
                  ),
                  SizedBox(
                    height: space2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(space1),
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.pop(context);
                            getImageFromCamera();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('camera_txt'.tr(ctx),
                                  style: OwnTheme.normalBoldTextStyle(lang: lang)
                                      .colorChange(color: 'white')),
                              Image.asset(
                                'assets/icons/camera_icon.webp',
                                width: 15.sp,
                                height: 15.sp,
                                color: OwnTheme.colorPalette['white'],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: space2,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.pop(context);
                            getImageFromGallery();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('gallery_txt'.tr(ctx),
                                  style: OwnTheme.normalBoldTextStyle(lang: lang)
                                      .colorChange(color: 'white')),
                              Image.asset(
                                'assets/icons/gallery_icon.webp',
                                width: 15.sp,
                                height: 15.sp,
                                color: OwnTheme.colorPalette['white'],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: space2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  File? file;

  Future getImageFromCamera() async {

    var image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      file = File(image.path);
      updateProfile(img: file!.path);
    }
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      file = File(image.path);
      updateProfile(img: file!.path);
    }
  }

  Future<dynamic> updateProfile({img}) async {
    setState(() {
      isLoading = true;
      widget.user.name = name.text;
      widget.user.email = email.text;
    });

    var headers = {'token': '${BasicModel.userToken}'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}auth/update-info'));
    request.fields.addAll({'name': '${name.text}', 'email': '${email.text}'});

    debugPrint('url==${baseUrl}auth/update-info');

    if (img != null)
      request.files.add(await http.MultipartFile.fromPath('image', '${img}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      getProfileDate();
    } else {
      debugPrint('Error');
      debugPrint(response.reasonPhrase);
    }
    setState(() {
      isLoading = false;
    });
  }
}
