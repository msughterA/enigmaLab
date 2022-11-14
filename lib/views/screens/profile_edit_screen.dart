import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Sizer(builder: ((context, orientation, deviceType) {
      return SafeArea(
          child: Container(
        height: 100.h,
        width: 100.w,
      ));
    })));
  }
}
