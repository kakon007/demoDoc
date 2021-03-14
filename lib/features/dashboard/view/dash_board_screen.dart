import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/sign_in_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          this._backgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              title: new Text(
                StringResources.dasboardAppBarText,
                style: TextStyle(fontSize: 17),
              ),
              actions: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                  child: Row(
                    children: [
                      Text("Sign In"),
                      Icon(Icons.login)
                    ],
                  ),
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            drawer: Drawer(),
            body: Padding(
              padding: const EdgeInsets.only(top:200.0),
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  color: Colors.white
                ),
              ),
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
            'https://images.unsplash.com/photo-1527555197883-98e27ca0c1ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'
        ),
        placeholder: AssetImage('assetName'),
      ),
    );
  }

}
