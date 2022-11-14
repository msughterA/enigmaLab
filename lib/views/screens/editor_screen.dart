import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';
import 'package:enigmalab/views/widgets/reorderable_container.dart';
import 'package:enigmalab/views/widgets/pod.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(builder: ((context, orientation, deviceType) {
        return SafeArea(
            child: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(
              height: 10.h,
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: const BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Editor',
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: const BoxDecoration(
                        color: Palette.ligtBlue,
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: const Icon(
                      Icons.edit_note_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Container For Document title and No of questions added
            Container(
                width: 100.w,
                height: 8.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: const [
                      Text(
                        'Untitled Document',
                        style: TextStyle(
                            fontSize: 20,
                            color: Palette.darkGray,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(children: const [
                      Text(
                        'No Questions',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFFCDCDCD),
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ],
                )),
            Spacer(),
            // Section for questions and answers
            Column(
              children: [
                Container(
                    width: 100.w,
                    height: 59.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Container to hold all question pods
                          Container(
                              width: 100.w,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Palette.darkGray,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              constraints: BoxConstraints(
                                  minHeight: 25.h, maxHeight: double.infinity),
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Question',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  CustomReorderableColumn(
                                    children: [
                                      // const Align(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text('Question',
                                      //       style: TextStyle(
                                      //           fontSize: 18,
                                      //           fontWeight: FontWeight.w600)),
                                      // ),
                                      // Render Pod
                                      Pod(
                                        key: ValueKey('1'),
                                      ),
                                      Pod(
                                        key: ValueKey('2'),
                                      ),
                                      Pod(
                                        key: ValueKey('3'),
                                      ),
                                      Pod(
                                        key: ValueKey('4'),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Answer Section
                          Container(
                              width: 100.w,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Palette.darkGray,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              constraints: BoxConstraints(
                                  minHeight: 25.h, maxHeight: double.infinity),
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Answer',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  CustomReorderableColumn(
                                    children: [
                                      // const Align(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text('Question',
                                      //       style: TextStyle(
                                      //           fontSize: 18,
                                      //           fontWeight: FontWeight.w600)),
                                      // ),
                                      // Render Pod
                                      Pod(
                                        key: ValueKey('1a'),
                                      ),
                                      Pod(
                                        key: ValueKey('2a'),
                                      ),
                                      Pod(
                                        key: ValueKey('3a'),
                                      ),
                                      Pod(
                                        key: ValueKey('4a'),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )),
                Container(
                  height: 8.h,
                  width: 100.w,
                  margin: EdgeInsets.only(top: 0.9.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 100.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              color: Palette.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28))),
                          child: const Center(
                              child: Text(
                            'Previous',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 100.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              color: Palette.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28))),
                          child: const Center(
                              child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 100.h,
                          width: 30.w,
                          decoration: const BoxDecoration(
                              color: Palette.darkGreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: const Center(child: Icon(Icons.add_outlined)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ));
      })),
    );
  }
}
