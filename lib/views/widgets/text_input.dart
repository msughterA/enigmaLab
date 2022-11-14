import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? icon;
  final TextInputType? inputType;
  final Function? validator;
  final bool? obscureText;
  const TextInput(
      {Key? key,
      this.hintText,
      this.validator,
      this.icon,
      this.inputType,
      this.obscureText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 5.w,
      ),
      decoration: const BoxDecoration(
        color: Palette.lighGray,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator!(value);
        },
        keyboardType: inputType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            icon: icon,
            labelText: hintText,
            hintText: hintText,
            //errorText:errorText() ,
            border: InputBorder.none,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Palette.darkGreen),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Palette.lighGray))),
      ),
    );
  }
}
