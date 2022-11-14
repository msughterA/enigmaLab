import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/views/widgets/text_input.dart';
import 'package:enigmalab/utils/app_themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/math_background_4k.jpeg'))),
        child: Sizer(builder: ((context, orientation, deviceType) {
          return Stack(children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 50.h,
                width: 100.w,
                padding: EdgeInsets.only(
                    top: 10.h, left: 8.w, right: 8.w, bottom: 10.h),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    const TextInput(
                      hintText: 'email',
                      icon: Icon(Icons.email),
                    ),
                    const TextInput(
                      hintText: 'password',
                      icon: Icon(Icons.password_outlined),
                    ),
                    Container(
                      width: 100.w,
                      height: 6.h,
                      decoration: const BoxDecoration(
                          color: Palette.black,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            )
          ]);
        })),
      ),
    ));
  }
}
