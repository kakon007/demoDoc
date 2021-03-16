import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';


class CustomTextFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final EdgeInsetsGeometry contentPadding;
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

  const CustomTextFormField({
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
    this.isRequired = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.keyboardType,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.maxLines = 1,
    this.textFieldKey
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText != null)
          Row(
            children: [
              Flexible(
                child: Text("  ${labelText ?? ""}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(color: HexColor("#FF5B71")),
                )
            ],
          ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: HexColor("#0D1231").withOpacity(0.1), blurRadius: 10),
              BoxShadow(
                  color: HexColor("#0D1231").withOpacity(0.1), blurRadius: 10),
            ],
          ),
          child: TextFormField(
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
            validator:
            validator ?? (isRequired ? Validator().nullFieldValidate : null),
            controller: controller,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              prefix: prefix,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 15, color: HexColor("#D2D2D2")),
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: HexColor("#D6DCFF"),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: HexColor("#EAEBED"),
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
//        errorText != null ? Text('') : SizedBox(),
      ],
    );
  }
}
