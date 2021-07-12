import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/auth/view_model/auth_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/sign_up_view_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/dbmanager.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/userDetails_view_model.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/api_helper/url_launcher_helper.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _formatBirthDate = 'Select Date';
  List<String> selectedList;
  String selectedDuration;
  String birthDateBorderColor = "#EAEBED";
  DateTime pickedDate;
  var genderBorderColor = "#EAEBED";
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _address = TextEditingController();
  BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(25), topRight: Radius.circular(25));

// Option 2
  String _selectedGender;
  final _formKey = GlobalKey<FormState>();
  final DbManager dbmManager = new DbManager();
  SwitchAccounts accounts;
  List<SwitchAccounts> accountsList;
  String addAccountValue;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      //initialDatePickerMode: DatePickerMode.year,
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
      initialDate: pickedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null && date != pickedDate) {
      setState(() {
        birthDateBorderColor = "#EAEBED";
        pickedDate = date;
        _formatBirthDate = DateFormat("dd/MM/yyyy").format(pickedDate);
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      accountsList = await dbmManager.getAccountList();
    });
    super.initState();
    pickedDate = DateTime.now();
  }

  bool isTappedSignUpButton = false;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = Provider.of<SignUpViewModel>(context, listen: true);
    selectedList = StringResources.genderList;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width * 0.44;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var name = SignUpFormField(
      topPadding: isTablet ? 30 : 18,
      controller: _name,
      validator: Validator().nullFieldValidate,
      margin: EdgeInsets.all(2),
      textFieldKey: Key('signUpNameKey'),
      labelText: "Name",
      isRequired: true,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 17 : 14,
      hintText: StringResources.name,
    );
    var email = SignUpFormField(
      inputFormatters: [ FilteringTextInputFormatter.deny(RegExp("[ ]")),],
      keyboardType: TextInputType.emailAddress,
      topPadding: isTablet ? 30 : 25,
      controller: _email,
      textFieldKey: Key('signUpEmailKey'),
      validator: Validator().validateEmail,
      hintSize: isTablet ? 17 : 14,
      margin: EdgeInsets.only(bottom: 2),
      labelFontSize: isTablet ? 15 : 12,
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(11),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType: TextInputType.number,
      topPadding: isTablet ? 30 : 25,
      controller: _mobile,
      textFieldKey: Key('signUpMobileKey'),
      validator: Validator().validatePhoneNumber,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 17 : 14,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Mobile",
      hintText: StringResources.mobileNumber,
    );
    var password = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Password",
      hintText: StringResources.password,
    );
    var confirmPassword = SignUpFormField(
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Confirm Password",
      hintText: StringResources.confirmPassword,
    );
    var address = SignUpFormField(
      topPadding: isTablet ? 30 : 25,
      controller: _address,
      textFieldKey: Key('signUpAddressKey'),
      validator: Validator().nullFieldValidate,
      labelFontSize: isTablet ? 15 : 12,
      hintSize: isTablet ? 17 : 14,
      margin: EdgeInsets.only(bottom: 2),
      isRequired: true,
      labelText: "Address",
      hintText: StringResources.address,
    );
    String _formatDate = DateFormat("yyyy-MM-dd").format(pickedDate);
    var date = Row(
      children: [
        GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20.0,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(StringResources.dateOfBirth,
                            style: GoogleFonts.roboto(
                                fontSize: isTablet ? 15 : 12)),
                        Text(
                          " *",
                          style: GoogleFonts.roboto(
                              fontSize: isTablet ? 15 : 12,
                              color: HexColor("#FF5B71")),
                        )
                      ],
                    ),
                  )),
              Container(
                height: isTablet ? 50 : 45.0,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor(birthDateBorderColor)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "$_formatBirthDate",
                        style: TextStyle(
                            fontSize: isTablet ? 17 : 14,
                            color: _formatBirthDate == 'Select Date'
                                ? HexColor("#D2D2D2")
                                : Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 18,
                          child:
                              Image.asset("assets/images/calender_icon.png")),
                    ),
                  ],
                ),
              ),
              birthDateBorderColor != "#FF0000"
                  ? SizedBox(
                      width: 2,
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, right: 0),
                      child: Text(
                        "This Field Is Required",
                        style: GoogleFonts.poppins(
                            color: Colors.red, fontSize: 11),
                      )),
            ],
          ),
          onTap: () {
            FocusManager.instance.primaryFocus.unfocus();
            selectDate(context);
          },
          key: Key('signUpBirthDateKey'),
        ),
      ],
    );
    var gender = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 20.0,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(StringResources.gender,
                          style:
                              GoogleFonts.roboto(fontSize: isTablet ? 15 : 12)),
                      Text(
                        " *",
                        style: GoogleFonts.roboto(
                            fontSize: isTablet ? 15 : 12,
                            color: HexColor("#FF5B71")),
                      )
                    ],
                  ),
                )),
            Container(
              height: isTablet ? 50 : 45.0,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor(genderBorderColor)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      width: width * .87,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          onTap: (){
                            FocusManager.instance.primaryFocus.unfocus();
                          },
                          key: Key('signUpGenderKey'),
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: _selectedGender != null
                                ? Colors.black54
                                : HexColor("#D2D2D2"),
                          ),
                          iconSize: 25,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              enabledBorder: InputBorder.none),
                          isExpanded: true,
                          hint: Text(
                            StringResources.gender,
                            style: GoogleFonts.roboto(
                                fontSize: isTablet ? 17 : 15,
                                color: HexColor("#D2D2D2")),
                          ),
                          value: _selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              genderBorderColor = "#EAEBED";
                              _selectedGender = newValue;
                            });
                          },
                          items: StringResources.genderList.map((gender) {
                            return DropdownMenuItem(
                              child: new Text(
                                gender,
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                              value: gender,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            genderBorderColor != "#FF0000"
                ? SizedBox(
                    width: 2,
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, right: 0),
                    child: Text(
                      "This Field Is Required",
                      style:
                          GoogleFonts.poppins(color: Colors.red, fontSize: 11),
                    )),
          ],
        ),
      ],
    );
    var signUpButton = AbsorbPointer(
      absorbing: isTappedSignUpButton ? true : false,
      child: GestureDetector(
        onTap: () async {
          //signUp(_name.text,_email.text, _mobile.text, _address.text, _selectedGender,_formatDate2);
          //showAlert(context);
          if (_formKey.currentState.validate() && _selectedGender != null && _formatBirthDate!='Select Date') {
            setState(() {
              isTappedSignUpButton = true;
            });
            BotToast.showLoading();
            await vm.getSignUpInfo(_name.text, _email.text, _mobile.text,
                _address.text, _selectedGender, _formatDate);
            if (vm.message == "Saved Successfully") {
              var vm5 = Provider.of<AuthViewModel>(context, listen: false);
              await vm5.getAuthData(vm.username, vm.password);
              if (vm5.accessToken != null) {
                accountsList.forEach((item) {
                  if (item.username.contains(vm.username)) {
                    addAccountValue = vm.username;
                  }
                });
                if (addAccountValue == null) {
                  var vm3 =
                      Provider.of<UserImageViewModel>(context, listen: false);
                  var vm4 =
                      Provider.of<UserDetailsViewModel>(context, listen: false);
                  await vm4.getSwitchData(vm5.accessToken);
                  await vm3.switchImage(vm5.accessToken);
                  SwitchAccounts switchAccounts = new SwitchAccounts(
                    name: vm4.userSwitchDetailsList.fname,
                    relation: vm3.switchDetails?.photo == null
                        ? ""
                        : vm3.switchDetails.photo,
                    username: vm.username,
                    password: vm.password,
                  );
                  dbmManager.insertStudent(switchAccounts).then((id) => {});
                }
                BotToast.closeAllLoading();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("username", vm.username);
                prefs.setString("password", vm.password);
                appNavigator
                    .getProvider<AccessTokenProvider>()
                    .setToken(vm5.accessToken);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(
                        accessToken: vm5.accessToken,
                      ),
                    ),
                    (Route<dynamic> route) => false);
              }
              showAlert(context);
            } else {
              BotToast.closeAllLoading();
              setState(() {
                isTappedSignUpButton = false;
              });
            }
          } else {
            BotToast.closeAllLoading();
            setState(() {
              isTappedSignUpButton = false;
              if (_selectedGender == null) {
                genderBorderColor = "#FF0000";
              }
              if (_formatBirthDate == 'Select Date') {
                birthDateBorderColor = "#FF0000";
              }
            });
          }
        },
        key: Key('signUpButtonKey'),
        child: Material(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppTheme.signInSignUpColor,
          child: SizedBox(
            height: height >= 600 ? 50 : 40,
            width: MediaQuery.of(context).size.width / .2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  StringResources.signUpButton,
                  style: TextStyle(
                      fontSize: isTablet
                          ? 20
                          : height >= 600
                              ? 18
                              : 15,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    var signIn = Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringResources.alreadyHaveAnAccount,
                style: TextStyle(
                    fontSize: isTablet ? 16 : 13,
                    color: AppTheme.signInSignUpColor,
                    fontWeight: FontWeight.w300)),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              key: Key('signInKey'),
              child: Text(
                StringResources.signInText,
                style: TextStyle(
                    fontSize: isTablet ? 16 : 13,
                    color: AppTheme.signInSignUpColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
    var termsPolicy = Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          StringResources.agreeToTerms,
          style: GoogleFonts.roboto(
              color: HexColor("#8592E5"), fontSize: isTablet ? 16 : 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringResources.terms,
              style: GoogleFonts.roboto(
                  color: AppTheme.signInSignUpColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 16 : 13),
            ),
            Text(
              " and  ",
              style: GoogleFonts.roboto(
                  color: HexColor("#8592E5"), fontSize: isTablet ? 16 : 13),
            ),
            GestureDetector(
              onTap: (){
                UrlLauncherHelper.launchUrl('https://qa.myhealthbd.com:9096/medicare-web-client-v2/#/myhealthbd/contact');
              },
              child: Text(
                StringResources.policy,
                style: GoogleFonts.roboto(
                    color: AppTheme.signInSignUpColor,
                    fontWeight: FontWeight.bold,
                    fontSize: isTablet ? 16 : 13),
              ),
            ),
          ],
        )
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#F1F9FF"),
      body: Stack(children: <Widget>[
        this._backgroundImage(),
        Scaffold(
          appBar: new AppBar(
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          //resizeToAvoidBottomInset: false,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width * .04),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          color: HexColor("#FFFFFF"),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor("#0D1231").withOpacity(0.08),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: isTablet ? 35 : 15.0,
                              left: isTablet ? 35 : 15),
                          child: Column(
                            children: [
                              spaceBetween,
                              Center(
                                  child: Text(
                                StringResources.createAccount,
                                key: Key('createAnAccountKey'),
                                style: TextStyle(
                                    color: HexColor("#0D1231"),
                                    fontSize: isTablet ? 25 : 20.0,
                                    fontWeight: FontWeight.w500),
                              )),
                              spaceBetween,
                              name,
                              email,
                              mobile,
                              //password,
                              //confirmPassword,
                              address,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  gender,
                                  date,
                                ],
                              ),
                              spaceBetween,
                              Column(
                                children: [
                                  spaceBetween,
                                  spaceBetween,
                                  spaceBetween,
                                  signUpButton,
                                  spaceBetween,
                                  signIn,
                                  spaceBetween,
                                  termsPolicy
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  //     BoxShadow(
                  //       color: HexColor("#0D1231").withOpacity(0.08),
                  //       spreadRadius: 10,
                  //       blurRadius: 7,
                  //       offset: Offset(0, 3), // changes position of shadow
                  //     ),
                  //   ]),
                  //   height: height >= 600 ? 200 : 150,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 15.0, left: 15),
                  //     child: Column(
                  //       children: [
                  //         spaceBetween,
                  //         spaceBetween,
                  //         spaceBetween,
                  //         vm.isLoading==true ? Center(child: CircularProgressIndicator()) : signUpButton,
                  //         spaceBetween,
                  //         signIn,
                  //         spaceBetween,
                  //         termsPolicy
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _backgroundImage() {
    bool isTablet = Responsive.isTablet(context);
    return Stack(
      children: [
        Positioned(
          top: isTablet ? 35 : MediaQuery.of(context).size.width * .15,
          left: MediaQuery.of(context).size.width * .32,
          right: MediaQuery.of(context).size.width * .32,
          child: Container(
            height: MediaQuery.of(context).size.width * .13,
            alignment: Alignment(0, -0.75),
            child: FadeInImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/logo_new.png"),
              placeholder: AssetImage(''),
            ),
          ),
        )
      ],
    );
  }

  void showAlert(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = Provider.of<SignUpViewModel>(context, listen: false);
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
                height: 200,
                width: isTablet ? MediaQuery.of(context).size.width * .7 : 250,
                // child: SizedBox.expand(child: FlutterLogo()),
                //margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(begin: Alignment.topRight,
                      // end: Alignment.topCenter,
                      stops: [
                        0.2,
                        0.5,
                      ], colors: [
                    HexColor("#D6DCFF"),
                    HexColor("#FFFFFF"),
                  ]),
                  //borderRadius: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: isTablet ? 25 : 15),
                      child: Text(
                        vm.message,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Username : ",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     Text(
                    //       vm.username,
                    //       style: GoogleFonts.poppins(),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Password: ",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     Text(
                    //       vm.password,
                    //       style: GoogleFonts.poppins(),
                    //     )
                    //   ],
                    // ),
                    Text(
                      "An sms has been sent to your mobile number with your username and password.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            minWidth: 120,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: AppTheme.appbarPrimary,
                            child: Text(
                              "OK",
                              key: Key('signUpOKButtonKey'),
                              style: GoogleFonts.poppins(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
