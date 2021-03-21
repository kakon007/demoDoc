import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class MyHealthScreen extends StatefulWidget {
  @override
  _MyHealthScreenState createState() => _MyHealthScreenState();
}

class _MyHealthScreenState extends State<MyHealthScreen> {
  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('Chest Medicine', false),
    SimpleModel('cardiology', false),
    SimpleModel('Child Neurology', false),
    SimpleModel('Chest Medicine', false),
    SimpleModel('Dermatology', false),
    SimpleModel('Diabetics', false),
  ];
  final List<SimpleModel> _items2 = <SimpleModel>[
    SimpleModel('Child Specialist', false),
    SimpleModel('Chest Surgeon', false),
    SimpleModel('Diabetologist', false),
    SimpleModel('Endocrinologist', false),
    SimpleModel('ENT', false),
    SimpleModel('Gastroenterologist', false),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width * 0.44;
    var verticalSpace=SizedBox(
      width: width >= 400 ? 10.0 : 5.0,
    );
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var searchDepartment=  TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
            child: Icon(Icons.search),
          ),
          hintText: "Search Department",
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: HexColor("#D6DCFF"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: HexColor("#EAEBED"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius:  BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)
          ),

      ));
    var searchSpeciality=  TextFormField(
        decoration: new InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
            child: Icon(Icons.search),
          ),
          hintText: "Search Speciality",
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: HexColor("#D6DCFF"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: HexColor("#EAEBED"), width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius:  BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)
          ),

        ));
    var departmentList=       Expanded(
      child: ListView(
        children: _items
            .map(
              (SimpleModel item) => Container(
            height: 35,
            child: CheckboxListTile(
              activeColor: AppTheme.colorPrimary,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item.title),
              value: item.isChecked,
              onChanged: (bool val) {
                setState(() => item.isChecked = val);
              },
            ),
          ),
        )
            .toList(),
      ),
    );
    var specialityList=       Expanded(
      child: ListView(
        children: _items2
            .map(
              (SimpleModel item) => Container(
            height: 35,
            child: CheckboxListTile(
              activeColor: AppTheme.colorPrimary,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(item.title),
              value: item.isChecked,
              onChanged: (bool val) {
                setState(() => item.isChecked = val);
              },
            ),
          ),
        )
            .toList(),
      ),
    );

    var modalSheetTitle=Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        verticalSpace,
        Text("Filters", style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
        Icon(Icons.clear),
      ],);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colorPrimary,
        title: Text("MyHealthBD"),
      ),
      body: Center(
        child:
        Column(
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.only( topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))
                        ),
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                                return FractionallySizedBox(
                                  heightFactor:0.8,
                                  child: Column(children: [
                                    horizontalSpace,
                                    horizontalSpace,
                                    modalSheetTitle,
                                    Container(
                                      height: 250,
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)
                                        ),
                                        border: Border.all(
                                          color: HexColor("#D6DCFF"),//                   <--- border color
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          searchDepartment,
                                          departmentList
                                        ],
                                      ),
                                    ),
                                    horizontalSpace,
                                    horizontalSpace,
                                    horizontalSpace,
                                    Container(
                                      height: 250,
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)
                                        ),
                                        border: Border.all(
                                          color: HexColor("#D6DCFF"),//                   <--- border color
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          searchSpeciality,
                                          specialityList
                                        ],
                                      ),
                                    ),
                                  ],),
                                );
                              }),
                        );
                      });
                },
                child: Text("Bottom Modal Sheet"),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
class SimpleModel {
  String title;
  bool isChecked;

  SimpleModel(this.title, this.isChecked);
}