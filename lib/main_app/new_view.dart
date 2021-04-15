import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/new_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_date_picker.dart';
import 'package:myhealthbd_app/main_app/views/widgets/edit_screen_save_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/rounded_loading_button.dart';

import 'views/widgets/custom_textfield.dart';
import '../main_app/views/widgets/custom_date_picker.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  Widget spaceBetweenSections = SizedBox(height: 30);
  DateTime applicationDeadline;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
      ),
      body: Container(),
    );
  }
}
