import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/util/common_style_text_field.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode focusNode;
  final bool autofocus;
  final TextInputAction textInputAction;
  final ValueChanged<String> onSubmitted;
  final Widget prefix;
  final Widget suffixIcon;
  final Function onChanged;
  final Key textFieldKey;

  const CustomTextField({
    this.textFieldKey,
    this.suffixIcon,
    this.prefix,
    this.onChanged,
    this.textInputAction,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.minLines,
    this.keyboardType,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    this.maxLines = 1,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(labelText != null)
          Text("${labelText ?? ""}",
              style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
            height: 5
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: CommonStyle.boxShadow,
//            boxShadow: [
//              BoxShadow(
//                  color: Color(0xff000000).withOpacity(0.2), blurRadius: 20),
//              BoxShadow(
//                  color: Color(0xfffafafa).withOpacity(0.2), blurRadius: 20),
//            ],
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
            decoration: InputDecoration(
              prefix: prefix,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: contentPadding,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                  BorderSide(color: Theme.of(context).primaryColor)),
            ),
          ),
        ),
//        errorText != null ? Text('') : SizedBox(),
      ],
    );
  }
}
