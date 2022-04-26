import 'package:e_commerce_application_full/models/authprovider.dart';
import 'package:e_commerce_application_full/utils/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  static const id = "loginpage";
  GlobalKey formkey = GlobalKey<FormState>();
  TextEditingController inputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/baglogo.png",
                height: 350,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "SHOP BIZ",
                style: TextStyle(fontSize: 30, fontFamily: 'Students'),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: inputcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter phone number',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        color: primarycolor,
                        onPressed: () {
                          if (User != null) {
                            final phone = '+92' + inputcontroller.text;
                            AuthProvider().LoginwithPhone(context, phone);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Log In ",
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
