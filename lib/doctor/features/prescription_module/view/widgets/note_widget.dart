import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({Key key}) : super(key: key);
  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  bool showReport = false;
  var _noteFieldFocusNode2 = FocusNode();

  Widget build(BuildContext context) {
    var templateVm = Provider.of<GetTamplateDataViewModel>(context);
    bool isTablet = Responsive.isTablet(context);
    var width = MediaQuery.of(context).size.width;

    var writeDetailsField = Container(
      width: isTablet ? width * 92 : MediaQuery.of(context).size.width * .89,
      height: isTablet ? 200 : 100,
      child: SizedBox(
        height: 500,
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          //maxLength: 75,
          maxLengthEnforced: false,
          autofocus: false,
          textInputAction: TextInputAction.newline,
          focusNode: _noteFieldFocusNode2,
          controller: templateVm.noteTextEditingController,
          cursorColor: HexColor('#C5CAE8'),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type here',
            hintStyle: GoogleFonts.poppins(
                fontSize: isTablet ? 15 : 11, fontWeight: FontWeight.w400),
            fillColor: Colors.white,
          ),
          onSubmitted: (v) {
            //vm2.search(_searchTextEditingController2.text,widget.accessToken);
          },
          // inputFormatters: [
          //   LengthLimitingTextInputFormatter(75),
          // ]
        ),
      ),
    );
    return PrescriptionCommonWidget(
      controller: expandableControllers.noteController,
      onChangeShowReport: (bool val) {
        templateVm.noteShowReport = val;
        setState(() {});
      },
      showReport: templateVm.noteShowReport,
      title: "Note",
      expandedWidget: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppTheme.buttonActiveColor, width: 2)),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 10),
          child: writeDetailsField,
        ),
      ),
    );
  }
}
