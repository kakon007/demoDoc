import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myhealthbd_app/doctor/features/profile/repositories/personal_info_repository.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/company_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/doctor_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view/widgets/personal_info.dart';
import 'package:myhealthbd_app/doctor/features/profile/view_model/personal_info_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  int index = 1;
  File _image;
  final picker = ImagePicker();
  bool isEdit = false;
  bool shouldDenyClick = false;
  var response;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    //   print("ish ${await _image.length()}");
    //   setState(() {
    //     isEdit = true;
    //   });
    // } else {
    //   print('No image selected.');
    // }

    if (pickedFile != null) {
//      var compressedImage = await ImageCompressUtil.compressImage(file, 80);
      Future<File> croppedFile = ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Theme.of(context).primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      croppedFile.then((value) async {
        _image = value;
        //print("ish ${await _image.length()}");
        setState(() {
          isEdit = true;
        });
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    var vm = PersonalInfoViewModel.read(context);
    // vm.editingPersonalInfo(isPersonalInfoEditing: false);
    vm.editingPersonalInfo(isPersonalInfoEditing: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var personalInfoVm = PersonalInfoViewModel.watch(context);
    //var vm2 = Provider.of<UserImageViewModel>(context, listen: true);
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var photo = companyInfoVm.details?.photo ?? '';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: 10,
    );
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    double imageHeight = 120;
    double imageWidth = width <= 330 ? 120 : 120;
    var imageSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.buttonActiveColor),
              color: Colors.white,
            ),
            height: imageHeight,
            width: imageWidth,
            child: Center(
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: Image.file(
                        _image,
                        height: 110,
                        width: 110,
                        fit: BoxFit.fill,
                      ))
                  : photo != ''
                      ? companyInfoVm.loadDoctorProfileImage(photo, 110, 110, 19)
                      : Image.asset(
                          'assets/images/dPro.png',
                          height: 80,
                          width: width <= 330 ? 80 : 80,
                        ),
            )),
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                shouldDenyClick
                    ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.buttonActiveColor),
                        ),
                      )
                    : FlatButton(
                        minWidth: MediaQuery.of(context).size.width * .45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: AppTheme.buttonActiveColor,
                        onPressed: () async {
                          setState(() {
                            shouldDenyClick = true;
                          });
                          isEdit == false
                              ? getImage()
                              : await companyInfoVm.updateImage(
                                  _image,
                                  companyInfoVm.details.name,
                                  companyInfoVm.details.userId.toString());
                          setState(() {
                            if (companyInfoVm.resStatusCode == '200') {
                              isEdit = false;
                              shouldDenyClick = false;
                              if (companyInfoVm.isImageLoading == false) {
                                _image = null;
                              }
                            } else {
                              isEdit = false;
                              shouldDenyClick = false;
                            }
                          });
                        },
                        child: Text(
                          isEdit == false
                              ? 'Update Your Avatar'
                              : 'Save Avatar',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: isTablet
                                  ? 18
                                  : width <= 330
                                      ? 12
                                      : 15,
                              fontWeight: FontWeight.w600),
                        )),
                //Text('*Your photo should be friendly and head shot. Clearly identitifiable as you.',maxLines: 2,)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * .45,
                    child: Text(
                      '*Your photo should be friendly and head shot. Clearly identitifiable as you.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(fontSize: isTablet ? 14 : 12),
                    ))
              ],
            ),
          ],
        ),
      ],
    );
    var personalInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 1;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .27,
        decoration: BoxDecoration(
            color: index == 1 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Center(
            child: Text(
          'Personal Info',
          style: GoogleFonts.poppins(
              fontSize: isTablet
                  ? 15
                  : width <= 330
                      ? 11
                      : 12,
              color: index == 1 ? Colors.white : Colors.black,
              fontWeight: index == 1 ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
    var contactInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 2;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .27,
        decoration: BoxDecoration(
            color: index == 2 ? AppTheme.buttonActiveColor : Colors.white,
            border: Border(
              left: BorderSide(
                color: HexColor('#F1F1F1'),
                width: 1,
              ),
              right: BorderSide(
                color: HexColor('#F1F1F1'),
                width: 1,
              ),
            )),
        child: Center(
            child: Text(
          'Company Info',
          style: GoogleFonts.poppins(
              fontSize: isTablet
                  ? 15
                  : width <= 330
                      ? 11
                      : 12,
              color: index == 2 ? Colors.white : Colors.black,
              fontWeight: index == 2 ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
    var userInfoTab = GestureDetector(
      onTap: () {
        setState(() {
          index = 3;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .21,
        decoration: BoxDecoration(
            color: index == 3 ? AppTheme.buttonActiveColor : Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Center(
            child: Text(
          'User Info',
          style: GoogleFonts.poppins(
              fontSize: isTablet
                  ? 15
                  : width <= 330
                      ? 11
                      : 12,
              color: index == 3 ? Colors.white : Colors.black,
              fontWeight: index == 3 ? FontWeight.w600 : FontWeight.normal),
        )),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(
        //       Icons.notes,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        title: Text(
          "My Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: imageSection,
                  ),
                  spaceBetween,
                  spaceBetween,
                  spaceBetween,
                  index == 1
                      ? PersonalInfo()
                      : index == 2
                          ? CompanyInfo()
                          : UserInfo(),
                  spaceBetween,
                ],
              ),
            ),
            Positioned(
              top: 150,
              right: MediaQuery.of(context).size.width * .125,
              left: MediaQuery.of(context).size.width * .125,
              child: Container(
                //alignment:Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#0D1231").withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                height: 40, width: MediaQuery.of(context).size.width * .5,
                child: Row(
                  children: [personalInfoTab, contactInfoTab, userInfoTab],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
