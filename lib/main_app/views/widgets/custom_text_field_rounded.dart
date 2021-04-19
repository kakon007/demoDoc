import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextFieldRounded extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode focusNode;
  final bool autofocus;
  final bool autovalidate;
  final bool obscureText;
  final double height;
  final double width;
  final TextInputAction textInputAction;
  final ValueChanged<String> onSubmitted;
  final Widget prefix;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isRequired;
  final Function onChanged;
  final double fontSize;
  final String errorText;
  final Key textFieldKey;
  final EdgeInsetsGeometry margin;
  const CustomTextFieldRounded({
    this.margin,
    this.textFieldKey,
    this.errorText,
    this.prefix,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize = 15,
    this.onChanged,
    this.isRequired = false,
    this.textInputAction,
    this.autovalidate = false,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.minLines,
    this.keyboardType,
    this.contentPadding,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    double circularRadius = 15;
    bool hasError = errorText != null;
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (labelText != null)
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text("  ${labelText ?? ""}",
                        style: GoogleFonts.roboto(fontSize: 12)),
                  ),
                  if (isRequired)
                    Text(
                      " *",
                      style: GoogleFonts.roboto(color: HexColor("#FF5B71")),
                    )
                ],
              ),
            ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height*.075,
            child: TextField(
              key: textFieldKey,
              minLines: minLines,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              autofocus: autofocus,
              focusNode: focusNode,
              maxLines: maxLines,
              keyboardType: keyboardType,
              controller: controller,
              textInputAction: textInputAction,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                prefix: prefix,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                TextStyle(fontSize: fontSize, color: HexColor("#D2D2D2")),
                // contentPadding: contentPadding,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: HexColor("#D6DCFF"), width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.fromLTRB(15.0, 35.0, 40.0, 0.0),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: HexColor("#EAEBED"), width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          errorText == null
              ? Text("")
              : Padding(
            padding: const EdgeInsets.only(left: 38, top: 8, right: 38),
            child: Text(
              errorText,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
