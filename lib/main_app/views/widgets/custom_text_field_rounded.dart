import 'package:flutter/material.dart';

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
  final TextInputAction textInputAction;
  final ValueChanged<String> onSubmitted;
  final Widget prefix;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function onChanged;
  final String errorText;
  final Key textFieldKey;

  const CustomTextFieldRounded({
    this.textFieldKey,
    this.errorText,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
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
    double circularRadius = 20;
    bool hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(labelText != null)
          Text("   ${labelText ?? ""}",
              style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        Container(

          decoration: BoxDecoration(
           // color: Theme.of(context).backgroundColor,
            color: Colors.white,
            borderRadius: BorderRadius.circular(circularRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200],
                  spreadRadius: 3,
                  blurRadius: 50,
                  offset: Offset(1, 1))
            ],
          ),
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
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(circularRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:hasError?Colors.red: Colors.transparent,
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(circularRadius),
              ),
            ),
          ),
        ),
        errorText == null
            ? Text("")
            : Padding(
          padding: const EdgeInsets.only(left: 38, top: 8,right: 38),
          child: Text(
            errorText,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
