import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/common_style_text_field.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final String labelText;
  final Widget hint;
  final T value;
  final ValueChanged<T> onChanged;
  final List<DropdownMenuItem<T>> items;
  final FormFieldValidator<T> validator;
  final FocusNode focusNode;
  final bool isExpanded;
  final Key customDropdownKey;
  final bool isRequired;
  final double height;
  final double width;
  Widget icon;

  CustomDropdownButtonFormField({
    this.validator,
    this.hint,
    this.labelText,
    this.isExpanded = false,
    this.focusNode,
    this.isRequired,
    this.height,
    this.width,
    this.icon,
    @required this.value,
    @required this.onChanged,
    @required this.items,
    this.customDropdownKey
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (labelText != null)
            Row(
              children: [
                Flexible(
                  child: Text("  ${labelText ?? ""}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                if (isRequired==true)
                  Text(
                    " *",
                    style: TextStyle(color: HexColor("#FF5B71")),
                  )
              ],
            ),
          SizedBox(height: 5),
          Container(
            height: height,
            width: width,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<T>(
                key: customDropdownKey,
                isExpanded: isExpanded,
                focusNode: focusNode,
                validator: validator,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                hint: hint,
                value: value,
                onChanged: onChanged,
                items: items,
                icon: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
