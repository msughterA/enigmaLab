import 'package:enigmalab/views/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    "Msughter's Profile",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                  ),
                  Container(
                      height: 8.h,
                      width: 8.h,
                      decoration: const BoxDecoration(
                          color: Palette.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: const Center(
                        child: Text('🥸', style: TextStyle(fontSize: 30)),
                      )),
                ],
              ),
            ),
            Spacer(),
            CircleAvatar(
              radius: 10.h,
              backgroundImage:
                  const AssetImage('assets/images/math_background_4k.jpeg'),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              width: 100.w,
              height: 8.h,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const Icon(Icons.person_outline),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                      height: 100.h,
                      width: 60.w,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'nateX',
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  const Spacer(),
                  const Icon(Icons.edit_outlined)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              height: 8.h,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const Icon(Icons.mail_outline),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                      height: 100.h,
                      width: 60.w,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'msughtera37@gmail.com',
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  const Spacer(),
                  const Icon(Icons.edit_outlined)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              height: 8.h,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const Icon(Icons.phone_iphone_outlined),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                      height: 100.h,
                      width: 60.w,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '+2348080891204',
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _showDialog(context,
                          text: const Text('Edit Phone Number'));
                    },
                    child: Icon(Icons.edit_outlined),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              height: 8.h,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  const Icon(Icons.school_outlined),
                  SizedBox(
                    width: 6.w,
                  ),
                  SizedBox(
                      height: 100.h,
                      width: 60.w,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'FEDERAL UNIVERSITY OF TECHNOLOGY OWERRI',
                          overflow: TextOverflow.ellipsis,
                        ),
                      )),
                  const Spacer(),
                  const Icon(Icons.edit_outlined)
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 100.w,
              height: 8.h,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Palette.darkGreen,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.wallet_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text('My Wallet')
                ],
              ),
            ),
          ]),
        ));
      })),
    );
  }

  Future _showDialog(
    BuildContext context, {
    Widget? icon,
    required Widget text,
  }) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              width: 70.w,
              height: 24.h,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextInput(
                    icon: icon,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Palette.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Ok',
                            style: TextStyle(color: Palette.white),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 5.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Cancel',
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
