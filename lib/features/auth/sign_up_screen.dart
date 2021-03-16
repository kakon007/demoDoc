import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_date_picker.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_dropdown_button_form_field.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_textformfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;
  String _dropDownValue;
  List<String> selectedList;
  String selectedDuration;

  @override
  Widget build(BuildContext context) {
    selectedList = StringResources.genderList;
    var height = MediaQuery.of(context).size.height;
    print(height);
    var spaceBetween = SizedBox(
      height: height >= 600 ? 20.0 : 10.0,
    );
    var name= SignUpField(
          labelText: "Name",
          isRequired: true,
          hintText: StringResources.name,
    );
    var email = SignUpField(
      isRequired: true,
      labelText: "Email",
      hintText: StringResources.email,
    );
    var mobile = SignUpField(
      isRequired: true,
      labelText: "Mobile",
      hintText: StringResources.email,
    );
    var password = SignUpField(
      isRequired: true,
      labelText: "Password",
      hintText: StringResources.email,
    );
    var confirmPassword = SignUpField(
      isRequired: true,
      labelText: "Confirm Password",
      hintText: StringResources.email,
    );
    var address = SignUpField(
      isRequired: true,
      labelText: "Address",
      hintText: StringResources.email,
    );
    var gender = CustomDropdownButtonFormField<String>(
      height: 40,
      width: 160,
      isRequired: true,
      labelText: StringResources.gender,
      hint: Text(StringResources.tapToSelectText),
      value: selectedDuration,
      onChanged: (value) {
        selectedDuration = value;
        setState(() {});
      },
      items: StringResources.genderList
          .map((e) => DropdownMenuItem<String>(
                child: Text(e),
                value: e,
                key: Key(e),
              ))
          .toList(),
    );
    var date = Padding(
      padding: EdgeInsets.only(left: 10),
      child: CommonDatePickerFormField(
        height: 68,
        width: 200,
        suffixIcon: Tab(
          child: Container(
            child: Image(
              image: AssetImage(
                'assets/images/calender_icon.png',
              ),
              // fit: BoxFit.cover,
            ),
            height: 25,
            width: 15,
          ),
        ),
        hintText: "Date of birth",
        isRequired: true,
        label: "Birth Date",
      ),
    );

    var signUpButton = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: HexColor('#141D53'),
        child: SizedBox(
          height: height >= 600 ? 40 : 30,
          width: MediaQuery.of(context).size.width / .2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringResources.signUpButton,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
    var signUp = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringResources.dontHaveAccount,
            style: TextStyle(
                color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
        Text(
          StringResources.signUpText,
          style: TextStyle(
              color: HexColor("#8592E5"), fontWeight: FontWeight.bold),
        )
      ],
    );
    return Stack(children: <Widget>[
      this._backgroundImage(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: height >= 600
              ? EdgeInsets.only(top: 100.0)
              : EdgeInsets.only(top: 160),
          child: new Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: HexColor("#FFFFFF")),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Column(

                children: [
                  spaceBetween,
                  Center(
                      child: Text(
                    StringResources.createAccount,
                    style: TextStyle(
                        color: HexColor("#0D1231"),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
                  spaceBetween,
                  name,
                  email,
                  mobile,
                  password,
                  confirmPassword,
                  address,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gender,
                      date,
                    ],
                  ),
                  spaceBetween,
                  signUpButton,
                  spaceBetween,
                  spaceBetween,
                  signUp
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _backgroundImage() {
    return Container(
      height: 370.0,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/dashboard_back.png"),
        placeholder: AssetImage(''),
      ),
    );
  }
}
