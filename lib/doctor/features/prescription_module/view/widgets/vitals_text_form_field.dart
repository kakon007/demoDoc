import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';

class VitalsTextField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String hintText;
  final String unitName;
  const VitalsTextField({this.controller, this.validator, this.hintText, this.unitName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 00, right: 0),
          child: Container(
            child: Stack(
              children: [
                DoctorFormField(
                  enabledBorderColor: "#D2D2D2",
                  rightContentPadding: 100,
                  // readOnly: isReadOnly,
                  //leftContentPadding: 85,
                  validator: validator,
                  controller: controller,
                  //validator: Validator().validateDoctorPhoneNumber,
                  hintText: hintText,
                  minimizeBottomPadding: true,
                ),
                Positioned(
                  top: 3,
                  right: 10,
                  child: Container(
                    height: 46,
                    width: 80,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          unitName,
                          style: GoogleFonts.poppins(color: Color(0xffD2D2D2)),
                        )),
                    decoration: BoxDecoration(
                        //  color: Color(0xffE8E8E8),
                        border: Border(
                      left: BorderSide(color: Color(0xffD2D2D2)),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
