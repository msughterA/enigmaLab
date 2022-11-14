import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(builder: ((context, orientation, deviceType) {
        return SafeArea(
            child: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(20),
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
                      Icons.search_outlined,
                      size: 30,
                    ),
                  ),
                  Container(
                      height: 8.h,
                      width: 8.h,
                      decoration: const BoxDecoration(
                          color: Palette.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: const Center(
                          child: Text(
                        '🧑🏽‍💻',
                        style: TextStyle(fontSize: 30),
                      )))
                ],
              ),
            ),
            Container(
              height: 11.h,
              width: 100.w,
              margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.darkGreen,
                  borderRadius: BorderRadius.all(Radius.circular(26))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Filter By',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('🏢')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'School',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
            Expanded(child: ListView.builder(itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 1.h),
                width: 100.w,
                height: 10.h,
                decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Row(children: [
                  CircleAvatar(
                    radius: 3.5.h,
                    backgroundImage: const AssetImage(
                        'assets/images/math_background_4k.jpeg'),
                  ),
                  Container(
                    width: 50.w,
                    height: 6.h,
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'GST 101',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text('2008'),
                        Text(
                          'natx',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                    child: Column(
                      children: const [
                        Text(
                          '13/20/2022',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ]),
              );
            }))),
            Container(
              margin: EdgeInsets.only(top: 1.h),
              height: 8.h,
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 70.w,
                      height: 8.h,
                      decoration: const BoxDecoration(
                          color: Palette.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(18.0))),
                      child: const Center(
                        child: Text(
                          'My posts',
                          style: TextStyle(color: Palette.white, fontSize: 16),
                        ),
                      )),
                  Container(
                    width: 18.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                        color: Palette.ligtBlue,
                        borderRadius: BorderRadius.all(Radius.circular(18.0))),
                    child: const Center(child: Icon(Icons.add_outlined)),
                  )
                ],
              ),
            )
          ]),
        ));
      })),
    );
  }
}
