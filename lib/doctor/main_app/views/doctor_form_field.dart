import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String labelText;
  final double labelFontSize;
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final bool minimizeBottomPadding;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry margin;
  final FocusNode focusNode;
  final bool autofocus;
  final bool enabled;
  final bool autovalidate;
  final bool readOnly;
  final bool isRequired;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  final Widget prefix;
  final Function onChanged;
  final int maxLength;
  final GestureTapCallback onTap;
  final Key textFieldKey;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final double borderRadius;
  final bool obSecure;
  final double topContentPadding;
  final double leftContentPadding;
  final double hintSize;
  final List<TextInputFormatter> inputFormatters;
  final String focusBorderColor;
  final String enabledBorderColor;
  final double labelLeftPadding;
  final double labelBottomPadding;

  const DoctorFormField({
    this.labelLeftPadding=10,
    this.labelBottomPadding=0,
    this.labelFontSize =12,
    this.enabledBorderColor = "#EAEBED",
    this.focusBorderColor="#D6DCFF",
    this.minimizeBottomPadding = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLength,
    this.validator,
    this.prefix,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.autovalidate = false,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintSize = 12,
    this.isRequired = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.minLines,
    this.prefixIcon,
    this.obSecure = false,
    this.suffixIcon,
    this.borderRadius = 10,
    this.onTap,
    this.margin = const EdgeInsets.only(top: 2, left: 5, right: 5),
    this.keyboardType,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.maxLines = 1,
    this.textFieldKey,
    this.topContentPadding=25,
    this.leftContentPadding=15,
    this.inputFormatters
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Container(
      margin: margin,
      child: Column(
        children: [
          if (labelText != null)
            Padding(
              padding:  EdgeInsets.only(left: labelLeftPadding, bottom: labelBottomPadding),
              child: Row(
                children: [
                  Flexible(
                    child: Text("  ${labelText ?? ""}",
                        style: GoogleFonts.roboto(fontSize: labelFontSize)),
                  ),
                  if (isRequired)
                    Text(
                      " *",
                      style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                    )
                ],
              ),
            ),
          TextFormField(
            inputFormatters: inputFormatters,
            obscureText: obSecure,
            key: textFieldKey,
            onTap: onTap,
            readOnly: readOnly,
            enabled: enabled,
            maxLength: maxLength,
            minLines: minLines,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            autofocus: autofocus,
            focusNode: focusNode,
            maxLines: maxLines,
            autovalidate: autovalidate,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            textInputAction: textInputAction,
            decoration: new InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              prefix: prefix,
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(fontSize: hintSize, color: HexColor("#D2D2D2")),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor(focusBorderColor), width: 1.0),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              contentPadding: EdgeInsets.fromLTRB(leftContentPadding, topContentPadding, 40.0, 0.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor(enabledBorderColor), width: 1.0),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1.0),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              hintText: hintText,
            ),
          ),
          errorText == null
              ? minimizeBottomPadding ? SizedBox(height: 0,) : Text("")
              : Padding(
            padding: const EdgeInsets.only(left: 38, top: 0, right: 38),
            child: Text(
              errorText,
              key: Key('requiredFieldKey'),
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
