import 'package:enigmalab/views/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:enigmalab/utils/app_themes.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(builder: ((context, orientation, deviceType) {
        return SafeArea(
            child: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                    Text(
                      "Msughter's Wallet",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            context: context,
                            builder: ((context) => DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: 0.4,
                                minChildSize: 0.4,
                                maxChildSize: 0.8,
                                builder: ((context, scrollController) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        children: [
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Account Number',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 5.h,
                                            width: 100.w,
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Palette.darkGray,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(
                                              children: const [
                                                Icon(Icons
                                                    .account_balance_outlined),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text('5080115018'),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              height: 5.h,
                                              width: 100.w,
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                  color: Palette.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: const Center(
                                                child: Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                      color: Palette.white),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                }))));
                      },
                      child: Container(
                          height: 8.h,
                          width: 8.h,
                          decoration: const BoxDecoration(
                              color: Palette.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          child: const Center(
                            child: Icon(
                              Icons.wallet_outlined,
                              color: Palette.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 12.h,
                width: 100.w,
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(127, 213, 200, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Earned'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$10.00',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 46.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(6),
                        height: 8.h,
                        width: 100.w,
                        decoration: const BoxDecoration(
                            color: Palette.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(127, 213, 200, 1),
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(Icons.call_received_outlined)),
                            ),
                            Container(
                              height: 100.h,
                              width: 60.w,
                              child: const Center(
                                  child: Text(
                                '\$5000 withdrawal to 5080115018',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )),
                            )
                          ],
                        ),
                      );
                    })),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: Container(
                            width: 70.w,
                            height: 20.h,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 8.h,
                                  color: Palette.darkGreen,
                                ),
                                const Spacer(),
                                const Text(
                                  'Request Sent Successfully',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 5.h,
                                      width: 48.w,
                                      decoration: BoxDecoration(
                                          color: Palette.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          'Ok',
                                          style:
                                              TextStyle(color: Palette.white),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                },
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Palette.black),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Request WithDrawal',
                        style: TextStyle(color: Palette.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.call_made_outlined,
                        color: Palette.white,
                        size: 14,
                      )
                    ],
                  )),
                ),
              )
            ],
          ),
        ));
      })),
    );
  }
}
