import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class SignInMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLogo(size: 100,),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  //StringResources.pleaseSignInToProceed,
                  "Please Sign In",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child: Text(StringResources.signInButtonText),
                      child: Text("Sign In"),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(CupertinoPageRoute(
                      //     builder: (context) => SignInScreen()));

                    },
                color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }
}
