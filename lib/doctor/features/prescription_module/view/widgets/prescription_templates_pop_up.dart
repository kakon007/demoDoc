import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
class PrescriptionTemplatesPopup extends StatefulWidget {
var accessToken;
PrescriptionTemplatesPopup({this.accessToken});
  @override
  _PrescriptionTemplatesPopupState createState() => _PrescriptionTemplatesPopupState();
}

class _PrescriptionTemplatesPopupState extends State<PrescriptionTemplatesPopup> {

  @override
  void initState() {
    var vm = Provider.of<PrescriptionTamplateViewModel>(context, listen: false);
    vm.getData(widget.accessToken);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<PrescriptionTamplateViewModel>(context, listen: true);
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: InkWell(
        onTap: (){

            // show the dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                int selectedRadio = 0;
                return  AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Templates", style: GoogleFonts.poppins(
                          // color: HexColor(
                          //   '#354291',
                          // ),
                            fontSize: isTablet
                                ? 20
                                : width <= 330
                                ? 14
                                : 16,
                            fontWeight: FontWeight.w600),),
                        SizedBox(width: 50,),
                        Icon(Icons.close)
                      ],
                    ),
                  ),
                  content: StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return Container(
                        height: 390,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: deviceWidth <= 360 ? deviceWidth * .38 : MediaQuery.of(context).size.width * .60,
                              height: 50,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(25),
                              //   color: Colors.white,
                              //   border: Border.all(color: HexColor('#E1E1E1')),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.only( bottom: 8),
                                child: TextField(
                                  autofocus: false,
                                  textInputAction: TextInputAction.search,
                                 // focusNode: _searchFieldFocusNode,
                                  //controller: _searchTextEditingController1,
                                  cursorColor: HexColor('#C5CAE8'),
                                  decoration: InputDecoration(
                                    //border: InputBorder.none,
                                      hintText: 'Search here',
                                      hintStyle: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(0.5)),
                                      fillColor: Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                                        //borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: HexColor('#F1F1F1')),
                                        //  when the TextFormField in unfocused
                                      ) ,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.search_sharp,
                                          color: Color(0xff6374DF),
                                        ),
                                        key: Key('notCompletedSearchFieldKey'),
                                        onPressed: () {
                                          //vm.search(_searchTextEditingController1.text, widget.accessToken);
                                        },
                                      )),
                                  key: Key('notCompletedSearchKey'),
                                  onSubmitted: (v) {
                                    //vm.search(_searchTextEditingController1.text, widget.accessToken);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Text("Saved Templates", style: GoogleFonts.poppins(
                                fontSize: isTablet
                                    ? 20
                                    : width <= 330
                                    ? 14
                                    : 16,
                                fontWeight: FontWeight.w600),),
                      Divider(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(vm.prescriptionTamplateList.length, (int index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.close,color: Color(0xffFB7F7F),),
                                        SizedBox(width: 12,),
                                        Text(vm.prescriptionTamplateList[index].templateName, style: GoogleFonts.poppins(
                                            fontSize: isTablet
                                                ? 20
                                                : width <= 330
                                                ? 13
                                                : 16,
                                            fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 50,),
                                  Radio(
                                    //description: "Covid Patient",
                                    focusColor: HexColor('#6374DF'),
                                    value: index,
                                    groupValue: selectedRadio,
                                    onChanged: (int value) {
                                      setState(() => selectedRadio = value);
                                    },
                                    //textPosition: RadioButtonTextPosition.left,
                                  ),

                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                            SizedBox(height: 40,),
                            Material(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      5)),
                              color: HexColor("#AFBBFF"),
                              child: SizedBox(
                                width: double.infinity,
                                height: deviceWidth <= 360
                                    ? 28
                                    : 40,

                                child: Center(
                                  child: Text(
                                    "Apply",
                                    style:
                                    GoogleFonts.roboto(
                                        color:
                                        Colors.white,
                                        fontSize: isTablet
                                            ? 15
                                            : deviceWidth <=
                                            360 &&
                                            deviceWidth >
                                                330
                                            ? 9
                                            : deviceWidth <=
                                            330
                                            ? 8
                                            : 12,
                                        fontWeight:
                                        FontWeight
                                            .w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              },
            );


        },
        child: Center(
          child: Container(
            color: Colors.black,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
