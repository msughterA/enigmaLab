import 'package:enigmalab/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Pod extends StatefulWidget {
  const Pod({super.key});

  @override
  State<Pod> createState() => _PodState();
}

class _PodState extends State<Pod> {
  bool _isLongPress = false;
  @override
  Widget build(BuildContext context) {
    // Pod renders text, image, video
    // it should defaults to text
    return Container(
      //color: Colors.green,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      width: 100.w,
      constraints: BoxConstraints(minHeight: 8.h),
      child: GestureDetector(
        //behavior: HitTestBehavior.deferToChild,
        //onLongPress: () {},
        onTap: () {
          setState(() {
            _isLongPress = !_isLongPress;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class PodWrapper extends StatefulWidget {
  final Widget child;
  final bool isLongPressed;
  final int pressedIndex;
  final int myIndex;
  PodWrapper(
      {super.key,
      required this.child,
      required this.pressedIndex,
      required this.myIndex,
      required this.isLongPressed});
  @override
  State<PodWrapper> createState() => _PodWrapperState();
}

class _PodWrapperState extends State<PodWrapper> {
  bool isPressed = false;
  int _index = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.myIndex;
  }

  @override
  Widget build(BuildContext context) {
    /// print('my ${widget.myIndex} drag index ${widget.dragStartIndex}');

    if ((widget.myIndex == widget.pressedIndex) &&
        widget.isLongPressed == true) {
      print('state set ${_index}');
      setState(() {
        isPressed = !isPressed;
      });
    } else if ((widget.myIndex != widget.pressedIndex) &&
        widget.isLongPressed == false) {
      setState(() {
        isPressed = false;
      });
    } else if ((widget.myIndex != widget.pressedIndex) &&
        widget.isLongPressed == true) {
      setState(() {
        isPressed = false;
      });
    }
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Stack(
        children: [
          widget.child,
          isPressed
              ? Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      width: 100.w,
                      height: 100.h,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0XFF01BC8E)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Edit',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 6.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.5.h))),
                            child: const Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 6.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.5.h))),
                            child: const Icon(
                              Icons.arrow_drop_up_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Container(
                              height: 6.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.5.h))),
                              child: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                              )),
                          const Spacer(),
                          Container(
                              height: 6.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                  color: Palette.ligtBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.5.h))),
                              child: const Icon(Icons.keyboard_outlined)),
                          const Spacer(),
                          Container(
                              height: 6.h,
                              width: 15.w,
                              decoration: BoxDecoration(
                                  color: Palette.ligtBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1.5.h))),
                              child: const Icon(Icons.camera_outlined))
                        ],
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
