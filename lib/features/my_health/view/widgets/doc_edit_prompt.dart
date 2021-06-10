import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/document_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/upload_documents_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:provider/provider.dart';

class EditDocAlert extends StatefulWidget {
  String docName;
  EditDocAlert({this.docName});
  @override
  _EditDocAlertState createState() => _EditDocAlertState();
}

class _EditDocAlertState extends State<EditDocAlert> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _address = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  DateTime pickBirthDate;
  String abc = "#EAEBED";
  double maxHeight=250;
  Future<Null> selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.appbarPrimary,
            accentColor: AppTheme.appbarPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.appbarPrimary),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
      initialDate: pickBirthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickBirthDate) {
      setState(() {
        pickBirthDate = date;
      });
    }
  }

  String _selectedGender;
  String _selectedBlood;
  String genderColor = "#EAEBED";
  String bloodBorderColor = "#EAEBED";

  @override
  void initState() {
    var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
      vm.getData();
       _username.text =widget.docName;
      _email.text = vm.userDetailsList.email;
      _mobile.text = vm.userDetailsList.phoneMobile;
      _address.text = vm.userDetailsList.address;
    });
    pickBirthDate = vm.userDetailsList.dob != null
        ? DateFormat("yyyy-MM-dd")
        .parse(vm.userDetailsList.dob)
        .add(Duration(days: 1))
        : pickBirthDate;
    _selectedBlood = vm.userDetailsList.bloodGroup != null
        ? vm.userDetailsList.bloodGroup
        : _selectedBlood;
    _selectedGender = vm.userDetailsList.gender != null
        ? vm.userDetailsList.gender == "M"
        ? "Male"
        : "Female"
        : _selectedBlood;
    // _selectedGender= vm.userDetailsList.gender!=null? vm.userDetailsList.gender : _selectedGender;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm3= Provider.of<DocumentViewModel>(context,listen: true);
    String _formatDate = DateFormat("yyyy-MM-dd").format(pickBirthDate);
    var vm = Provider.of<UserDetailsViewModel>(context, listen: true);
    var userId = vm.userDetailsList.id;
    var hospitalNumber = vm.userDetailsList.hospitalNumber;
    var regDate = vm.userDetailsList.regDate;
    var width = MediaQuery.of(context).size.width * 0.44;
    var name = SignUpFormField(
      hintSize: isTablet? 15 : 12,
      validator: Validator().nullFieldValidate,
      labelText: "Name",
      labelFontSize: isTablet? 15 : 12,
      isRequired: true,
      controller: _username,
      topPadding: 50,
      margin: EdgeInsets.only(
        top: 2,
      ),
      contentPadding: EdgeInsets.all(15),
      hintText: 'Name',
    );

    return Form(
      key: _formKey,
      child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                constraints: BoxConstraints(maxWidth:isTablet ?600 :  400, maxHeight: isTablet ? 350 : maxHeight),
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25, bottom: 15),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  // padding: new EdgeInsets.all(10.0),
                                  child: new Text(
                                    'Edit Document Name',
                                    style: GoogleFonts.poppins(
                                        color: AppTheme.appbarPrimary,
                                        fontSize: isTablet? 18 : 15.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                name,
                                SizedBox(height: isTablet? 30 : 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0, top: 22),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: isTablet? 250 :width * .9,
                                        height: isTablet? 60 : width * .25,
                                        child: FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          textColor: AppTheme.appbarPrimary,
                                          color: HexColor("#FFFFFF"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: AppTheme.appbarPrimary,
                                                  width: 1)),
                                          child: Text(
                                            StringResources.cancelText,
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:isTablet? 250 : width * .9,
                                        height: isTablet? 60 :width * .25,
                                        child: FlatButton(
                                          textColor: Colors.white,
                                          onPressed: () {

                                            if (_formKey.currentState.validate() && _selectedBlood!=null) {
                                              vm3.editDocument(fileName: _username.text);
                                              Fluttertoast.showToast(
                                                  msg: "Profile updated successfully!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                              Navigator.pop(context);

                                            }
                                            else{

                                            }
                                          },
                                          color: AppTheme.appbarPrimary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            "Submit",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
