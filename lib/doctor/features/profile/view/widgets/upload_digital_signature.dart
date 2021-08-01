import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/change_password_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/change_password_text_fileld.dart';
import 'package:myhealthbd_app/main_app/views/widgets/common_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSignaturePrompt extends StatefulWidget {
  @override
  _DoctorSignaturePromptState createState() => _DoctorSignaturePromptState();
}

class _DoctorSignaturePromptState extends State<DoctorSignaturePrompt> {
  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool isExpanded = false;
  bool isCurrentObSecure;
  bool isNewObSecure;
  bool isConfirmObSecure;

  @override
  void initState() {
    // TODO: implement initState
    isCurrentObSecure = true;
    isNewObSecure = true;
    isConfirmObSecure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var changePassViewModel = Provider.of<PasswordChangeViewModel>(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width ;
    var uploadFromGallery = Container(
      height: 50,
      width: deviceWidth,
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(10)
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Upload from gallery'),
            Icon(Icons.image,color: HexColor('#ECECEC'),)
          ],
        ),
      ),
    );
    var takeAPhoto = Container(
      height: 50,
      width: deviceWidth,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Take a photo'),
            Icon(Icons.camera_alt,color:HexColor('#ECECEC'),)
          ],
        ),
      ),
    );

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(
              horizontal:
              isTablet ? deviceWidth * .1 : deviceWidth* .1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            color: Colors.transparent,
            constraints: BoxConstraints(
              minHeight: 0

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                uploadFromGallery,
                SizedBox(height: 10,),
                takeAPhoto,
                //SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
