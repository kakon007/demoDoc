import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/main_app/test_screen1.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_auto_complete_text_field.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_searchable_dropdown_from_field.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class TestScreen2 extends StatefulWidget {
  @override
  _TestScreen2State createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  Widget spaceBetweenSections = SizedBox(height: 30);
  ZefyrController controller;
  final focusNode = FocusNode();
  String dropDownSelect;
  String autoCompleteSelect;


  List list =[
    'A',
    'B',
    'C',
    'D',
    'E'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final document = loadDocument();
    controller = ZefyrController(document);
  }

  NotusDocument loadDocument(){
    final Delta delta = Delta()..insert('Test text\n');
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                CustomRectangularButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MyScreen()));
                  },
                  text: 'Rich Text Field',
                  width: 220,
               ),

                SizedBox(height: 20,),

                CustomDropdownSearchFormField(
                  hintText: 'Select an item',
                  showSearchBox: true,
                  autoFocusSearchBox: true,
                  items: list,
                  onChanged: (v){
                  },
                ),
                SizedBox(height: 20,),
                CustomAutoCompleteTextField(
                  hintText: 'Type Something',
                    onSuggestionSelected: (v){
                        autoCompleteSelect = v;},
                    itemBuilder: (context, m) {
                        return Padding(
                        padding: const EdgeInsets.all(8.0),
                         child: Text(list[m]),
                          );
                        },
                    suggestionsCallback: (q){
                    },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
