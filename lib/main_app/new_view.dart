import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/new_screen.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_date_picker.dart';
import 'package:myhealthbd_app/main_app/views/widgets/edit_screen_save_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/rounded_loading_button.dart';

import 'views/widgets/custom_textfield.dart';

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              CustomTextField(
                autofocus: true,
                textFieldKey: Key("jobListSearchInputFieldKey"),
                textInputAction: TextInputAction.search,
                //focusNode: _searchFieldFocusNode,
                //onChanged: (v) => jobListViewModel.jobListFilters.searchQuery,
//                 onSubmitted: (v) {
// //                if (_searchTextEditingController.text.isNotEmpty)
//                   jobListViewModel.search(_searchTextEditingController.text);
//                 },
                suffixIcon: IconButton(
                  key: Key("jobListSearchButtonKey"),
                  icon: Icon(Icons.search),
                  onPressed: () {
//                  if (_searchTextEditingController.text.isNotEmpty)
                    // jobListViewModel.search(_searchTextEditingController.text);
                  },
                ),
                //controller: _searchTextEditingController,
                hintText: "Shakil",
              ),
              spaceBetweenSections,
              RoundedLoadingButton(

                valueColor: Colors.black,
                height: 55,
                width: 200,
                child: Text(
                  "Do Something",
                  key: Key('signInButtonKey'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>NewScreen2()));
                },
              ),
              spaceBetweenSections,
              EditScreenSaveButton(
                  onPressed: () {}, text: 'Shakil'),

              spaceBetweenSections,
              CommonDatePickerFormField(
                dateFieldKey: Key('applicationDeadlineDatePickerKey'),
                onDateTimeChanged: (DateTime d) {
                  applicationDeadline = d;
                  setState(() {});
                },
                date: applicationDeadline,
                label: 'Your date',
              ),


            ],
          ),
        ),

      ),
    );
  }
}
