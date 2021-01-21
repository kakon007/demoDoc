import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_text_field_rounded.dart';

class GetAppointment extends StatefulWidget {
  @override
  _GetAppointmentState createState() => _GetAppointmentState();
}

class _GetAppointmentState extends State<GetAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Appointment'),
      ),
      body: CustomTextFieldRounded(
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
    );
  }
}
