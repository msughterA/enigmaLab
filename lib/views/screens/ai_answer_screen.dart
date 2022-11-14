import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';
import 'package:enigmalab/views/widgets/pod.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class AiAnswerScreen extends StatelessWidget {
  const AiAnswerScreen({super.key});

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
                              '🔭',
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
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Question',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
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
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Answer',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 130,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Confidence'),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        child: SimpleCircularProgressBar(
                                          backColor: Palette.darkGray,
                                          progressStrokeWidth: 4,
                                          backStrokeWidth: 4,
                                          mergeMode: true,
                                          progressColors: const [
                                            Colors.lightGreen,
                                          ],
                                          valueNotifier: ValueNotifier(50),
                                          onGetText: (double value) {
                                            return Text(
                                              '${value.toInt()}%',
                                              style: TextStyle(fontSize: 10),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
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
                  decoration: const BoxDecoration(
                      color: Palette.black,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 100.h,
                          width: 60.w,
                          child: const Center(
                            child: Text(
                              'See Related Examples',
                              style: TextStyle(color: Palette.white),
                            ),
                          )),
                      Container(
                        height: 100.h,
                        width: 25.w,
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Palette.white,
                        ),
                      )
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
