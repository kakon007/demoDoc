import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_banner.dart';
import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';
import 'package:myhealthbd_app/main_app/new_view.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_circular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_textformfield.dart';
import 'main_app/test_screen2.dart';
import 'main_app/views/widgets/common_prompt_dialog.dart';
import './main_app/resource/strings_resource.dart';
import './main_app/views/widgets/please_sign_in_widget.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterDownloader.initialize(debug: true);
  // user trust SSL certificate for iss.ishraak.com socket server
  //if (Platform.isAndroid)  _loadCertificate();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //setupLocator();
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepOrange,
      //values: FlavorValues(baseUrl: kBaseUrDev)
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: FlavorBanner(
        child: Scaffold(
          appBar: AppBar(

            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                CustomCircularButton(
                  label: "Common Alert", onTap: (){
                  _showAlert();
                },),

                SizedBox(height: 10,),
                CustomCircularButton(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>SignInMessageWidget()));
                },
                label: 'Get Appointment',
                  //color: Colors.orange,
                ),
                SizedBox(height: 10,),
                // CustomCircularButton(onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>CustomTextFieldRounded()));
                // },
                //   label: "CustomTextField",
                //   color: Colors.orange,
                // ),

                CustomRectangularButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>TestScreen2()));
                  },
                  text:'ok',
                ),


                SizedBox(height: 10,),

                CustomTextFormField(
                  //controller: gpaTextController,
                  textFieldKey: Key('educationCGPA'),
                  labelText: StringResources.gpaText,
                  hintText: "Write Your CGPA",
                  validator: Validator().numberFieldValidateOptional,
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 10,),
                CustomTextFieldRounded(
                  textFieldKey: Key("signUpName"),
                  errorText: "Error",
                  keyboardType: TextInputType.text,
                  //focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  //controller: _nameEditingController,
                  hintText: "Enter",
                  prefixIcon: Icon(
                    Icons.person_outline,
                  ),
                  //onChanged: signUpModel.validateNameLocal,
                  // onSubmitted: (s) {
                  //   _nameFocusNode.unfocus();
                  //   FocusScope.of(_scaffoldKey.currentState.context)
                  //       .requestFocus(_emailFocusNode);
                  // },
                ),

              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _incrementCounter,
          //   tooltip: 'Increment',
          //   child: Icon(Icons.add),
          // ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
  _showAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return CommonPromptDialog(
            titleText: 'Common Prompt Alert',
            onAccept: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>NewScreen()));
            },
            onCancel: () {
              Navigator.pop(context);
            },
          );
        });
  }
}
