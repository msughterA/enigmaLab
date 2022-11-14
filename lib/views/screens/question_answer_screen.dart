import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';
import 'package:enigmalab/views/widgets/pod.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType) {
          return SafeArea(
              child: Container(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 30,
                        ),
                      ),
                      Container(
                          height: 8.h,
                          width: 8.h,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: const Center(
                            child: Text(
                              '📒',
                              style: TextStyle(fontSize: 35),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        constraints: BoxConstraints(minHeight: 30.h),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Palette.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28))),
                        child: Column(
                          children: [
                            Container(
                                height: 6.h,
                                width: 100.w,
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                    color: Palette.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Question 1 of 100',
                                      style: TextStyle(color: Palette.white),
                                    ),
                                    Icon(
                                      Icons.pages_outlined,
                                      color: Palette.white,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      // Container for Answer Box
                      Container(
                        width: 100.w,
                        constraints: BoxConstraints(minHeight: 30.h),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Palette.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28))),
                        child: Column(
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Answer',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 8.h,
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 100.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              color: Palette.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: const Center(
                            child: Text(
                              'Prev',
                              style: TextStyle(color: Palette.white),
                            ),
                          )),
                      Container(
                          height: 100.h,
                          width: 25.w,
                          decoration: const BoxDecoration(
                              color: Palette.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(color: Palette.white),
                            ),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ));
        },
      ),
    );
  }
}
