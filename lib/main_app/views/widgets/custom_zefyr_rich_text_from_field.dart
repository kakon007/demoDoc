import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class CustomZefyrRichTextFormField extends StatelessWidget {

  final ZefyrController controller;
  final String labelText;
  final String hintText;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode focusNode;
  final bool autofocus;
  final bool isRequired;
  final Widget prefix;
  final double height;
  final Key zefyrKey;

  const CustomZefyrRichTextFormField({
    this.prefix,
    @required this.controller,
    @required this.focusNode,
    this.isRequired = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.height = 120.0,
    this.contentPadding =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    this.zefyrKey
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if(labelText != null)
          Row(
            children: [
              Flexible(
                child: Text("  ${labelText ?? ""}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(color: Colors.red),
                )
            ],
          ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.2), blurRadius: 20),
              BoxShadow(
                  color: Color(0xfffafafa).withOpacity(0.2), blurRadius: 20),
            ],
          ),
          child: ZefyrField(
            key: zefyrKey,
            controller: controller,
            autofocus: autofocus,
            focusNode: focusNode,
            height: height,
            decoration: InputDecoration(
              prefix: prefix,
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
      ],
    );
  }
}

