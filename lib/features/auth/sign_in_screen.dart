import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/resource/const.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    var spaceBetween = SizedBox(
      height: height >= 600 ? 20.0 : 10.0,
    );
    var userName = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CustomTextFieldRounded(
        hintText: StringResources.usernameHint,
      ),
    );
    var password = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CustomTextFieldRounded(
        hintText: StringResources.passwordHint,
      ),
    );
    var rememberMe = Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  activeColor: HexColor('#141D53'),
                  key: Key('checkBoxKey'),
                  value: this.value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                StringResources.rememberMe,
                style: TextStyle(color: HexColor('#141D53'),),
              )
            ],
          ),
          Text(
            StringResources.forgetPassword,
            style: TextStyle(color: HexColor('#141D53'),),
          )
        ],
      ),
    );
    var signInButton = Padding(
      padding: const EdgeInsets.only(left: 12.0),
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
              child: Text(StringResources.signInButton, style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ),
    );
    var socialSignIn = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringResources.signInButton,
          style: TextStyle(fontWeight: FontWeight.w300, color: HexColor("#8592E5")),
        ),
        Container(
          height: 28,
          width: 30,
          child: Image.asset(facebookIcon),
        ),
        Text(StringResources.or, style: TextStyle( color: HexColor("#8592E5"), fontWeight: FontWeight.w300)),
        Container(
          height: 30,
          child: Image.asset(
            googleIcon,
          ),
        ),
      ],
    );
    var signUp = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringResources.dontHaveAccount,
            style: TextStyle(color:  HexColor("#8592E5"), fontWeight: FontWeight.w300)),
        Text(
          StringResources.signUpText,
          style: TextStyle(color:  HexColor("#8592E5"),  fontWeight: FontWeight.bold),
        )
      ],
    );
    return  Stack(
        children: <Widget>[
          this._backgroundImage(),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: height >= 600
                  ? EdgeInsets.only(top: 350.0)
                  : EdgeInsets.only(top: 160),
              child: new Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      children: [
                       spaceBetween,
                        spaceBetween,
                        Center(
                            child: Text(
                          StringResources.welcomeBack,
                          style: TextStyle(color: HexColor("#0D1231"),
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )),
                        spaceBetween,
                        userName,
                        password,
                        rememberMe,
                        signInButton,
                        spaceBetween,
                        socialSignIn,
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
