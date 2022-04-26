import 'package:e_commerce_application_full/homepage.dart';
import 'package:e_commerce_application_full/screens/Mainscree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  Future<bool> LoginwithPhone(BuildContext context, String phone) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpc = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User user = _auth.currentUser;
          if (user != null) {
            Navigator.pushReplacementNamed(context, MainPage.id);
          } else {
            Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verficationcode, int token) {
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: Text("Enter OTP: "),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: otpc,
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final code = otpc.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verficationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, MainPage.id);

                            print("success");
                          } else {
                            Fluttertoast.showToast(msg: 'something error');
                          }
                        },
                        child: Text("Verify"))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}
