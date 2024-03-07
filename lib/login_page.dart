// ignore_for_file: deprecated_member_use, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insta_story/utils/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.white,
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height * 0.28),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Text(
                  "change Password",
                  style: TextStyle(
                      color: AppColor.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.height * 0.02),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Text(
                  "Please enter the code we just sent to your \n WhatsApp number...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.indigo,
                      fontSize: screenSize.height * 0.02),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                const Text(
                  "+963******45",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.indigo, fontSize: 15),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 35),
                    Container(
                      height: 45,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.indigo.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.indigo.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.indigo.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.indigo.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(11)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.05),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't recieve any message?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColor.indigo, fontSize: 15),
                    ),
                    Text(
                      "Resend",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.indigo,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.indigo.withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {},
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 52),
                            child: Container(
                              width: 118,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: AppColor.indigo,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                            ))
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.indigo,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const HomeScreen()));
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 52),
                            child: Container(
                              width: 198,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: AppColor.indigo.withOpacity(0.6),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image(
                            //   image: ImageAssets.WhatsAppLogo,
                            //   height: 17,
                            // ),
                            SizedBox(width: 20),
                            Text(
                              "For help via WhatsApp",
                              style: TextStyle(
                                color: AppColor.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 52),
                        child: Container(
                          width: 298,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: AppColor.green,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
