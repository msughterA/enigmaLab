import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '/utils/app_themes.dart';

class CameraMode extends StatelessWidget {
  final Function? onpressed;
  final String? label;
  final bool? labelisWhite;
  final bool? fillisColor;
  final Color? color;
  const CameraMode(
      {super.key,
      this.label,
      this.onpressed,
      this.labelisWhite,
      this.fillisColor,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 2.w,
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 5.h, minWidth: 5.w),
        child: ElevatedButton(
          onPressed: () {
            //change the subject state
            onpressed!();
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  fillisColor! ? Palette.white : Palette.black.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.transparent)),
              padding: const EdgeInsets.all(5.0)),
          child: Text(
            label!,
            style:
                TextStyle(color: labelisWhite! ? Colors.black : Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
