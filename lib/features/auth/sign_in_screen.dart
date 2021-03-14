import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/sign_in_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';
import 'package:myhealthbd_app/main_app/views/widgets/rounded_loading_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool value = false;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = SizedBox(
      height: width>=400 ? 10.0: 20.0,
    );
    var userName = Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CustomTextFieldRounded(
        hintText: 'Username',
      ),
    );
    var password=    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CustomTextFieldRounded(
        hintText: 'Password',
      ),
    );
    var rememberMe=   Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  key: Key('checkBoxKey'),
                  value: this.value,
                  onChanged: (bool value) {
                    setState(() {
                      this.value = value;
                    });
                  }),
              Text(
                "Remember Me",
                style:
                TextStyle(color: HexColor('#354291')),
              )
            ],
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(color: HexColor('#354291')),
          )
        ],
      ),
    );
    var signInButton=   Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        color: HexColor('#354291'),
        child: SizedBox(
          height: width>=400 ? 30 :40,
          width: MediaQuery.of(context).size.width / .2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("SIGN IN"),
            ),
          ),
        ),
      ),
    );
    var socialSignIn=      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "sign in with ",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        Container(
          height: 28,
          width: 30,
          child: Image.asset("assets/images/facebook.png"),
        ),
        Text("or ",
            style: TextStyle(fontWeight: FontWeight.w300)),
        Container(
          height: 30,
          child: Image.asset(
            "assets/images/Google.png",
          ),
        ),
      ],
    );
    var signUp =   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 12)),
        Text(
          "Sign Up",
          style: TextStyle(fontSize: 14),
        )
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          this._backgroundImage(),
          Scaffold(
            backgroundColor: HexColor('#F1F9FF'),
            body: Padding(
              padding: width >= 400
                  ? EdgeInsets.only(top: 160.0)
                  : EdgeInsets.only(top: 350),
              child: new Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: width>=400? 10.0: 20.0,
                        ),
                        Center(
                            child: Text(
                          "Welcome Back",
                          style: TextStyle(
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
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      height: 500.0,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1527555197883-98e27ca0c1ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
        placeholder: AssetImage('assetName'),
      ),
    );
  }
}
