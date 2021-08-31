import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/repositories/delete_template_list_repository.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/prescription_template_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class UseTemplateWidget extends StatefulWidget {
  @override
  _UseTemplateWidgetState createState() => _UseTemplateWidgetState();
}

class _UseTemplateWidgetState extends State<UseTemplateWidget> {
  @override
  void initState() {
    var vm = Provider.of<PrescriptionTamplateViewModel>(context, listen: false);
    vm.getData();
    var vm2=Provider.of<GetTamplateDataViewModel>(context,listen: false);
    vm2.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<PrescriptionTamplateViewModel>(context, listen: true);
    var vm2 = Provider.of<GetTamplateDataViewModel>(context, listen: true);
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;

    final Widget template = SvgPicture.asset(
      "assets/icons/templ.svg",
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      color: Colors.white,
      //semanticsLabel: 'Acme Logo'
    );
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(color: Colors.grey))
      ),
      child: Padding(
        padding: const EdgeInsets.only(right:10,left:10),
        child: Row(
          children: [
            Text('Use Templates',style:GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
            Spacer(),
            InkWell(
              onTap: (){
                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    int selectedRadio = null;
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
                            InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.close))
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
                                  Expanded(
                                    child: Scaffold(
                                      body: Container(
                                        //mainAxisSize: MainAxisSize.min,
                                        child: ListView.builder(itemCount: vm.prescriptionTamplateList.length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (BuildContext context,
                                                int index)  {
                                              return Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 12.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            InkWell(onTap:() async {
                                                              SVProgressHUD.show(status: 'Deleting');
                                                             await DeleteTemplateRepository().deleteList(id: vm.prescriptionTamplateList[index].id).then((value) async =>await vm.getData());
                                                             SVProgressHUD.dismiss();
                                                              setState(() {});
                                                            },child: Icon(Icons.close,color: Color(0xffFB7F7F),)),
                                                            SizedBox(width: 12,),
                                                            Container(
                                                              width: 100,
                                                              child: Text(vm.prescriptionTamplateList[index].templateName, style: GoogleFonts.poppins(
                                                                fontSize: isTablet
                                                                    ? 20
                                                                    : width <= 330
                                                                    ? 13
                                                                    : 16,
                                                                fontWeight: FontWeight.w600,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 50,),
                                                  Column(
                                                    children: [
                                                      Radio(
                                                        //description: "Covid Patient",
                                                        focusColor: HexColor('#6374DF'),
                                                        value: index,
                                                        groupValue: selectedRadio,
                                                        onChanged: (int value) {
                                                          setState(() {
                                                            selectedRadio = value;
                                                            vm.getIdForTemplate(id: vm.prescriptionTamplateList[index].id);
                                                            print('value $selectedRadio');
                                                          });
                                                        },
                                                        //textPosition: RadioButtonTextPosition.left,
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  InkWell(
                                    onTap:(){
                                      SVProgressHUD.show(status: "Please Wait");
                                      vm2.getData(templateId: vm.id);
                                      SVProgressHUD.dismiss();
                                    },
                                    child: Material(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              5)),
                                      color:selectedRadio==null?AppTheme.buttonInActiveColor:AppTheme.buttonActiveColor,
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
              child: Container(
                width: 120,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff6374DF),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(right:10,left:10),
                  child: Row(
                    children: [
                      template,
                      Spacer(),
                      Text('Templates',style:GoogleFonts.roboto(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
