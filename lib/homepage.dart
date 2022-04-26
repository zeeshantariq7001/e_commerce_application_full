import 'package:e_commerce_application_full/utils/custom_colors.dart';
import 'package:e_commerce_application_full/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInitPage extends StatelessWidget {
  static const id = "homepage";
  Future Signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(
        () => Navigator.pushReplacementNamed(context, LogInPage.id));
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  TextEditingController houseC = TextEditingController();

  TextEditingController streetC = TextEditingController();

  TextEditingController cityC = TextEditingController();
  TextEditingController provinceC = TextEditingController();

  TextEditingController countryC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  submit() {
    if (formkey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('home page'),
        actions: [
          IconButton(
              onPressed: () {
                Signout(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Card(
                child: Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: nameC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter name",
                                  labelText: "What people call you",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: emailC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  labelText: "What is your email",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: houseC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter house no.",
                                  labelText: "What is your house no.",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: streetC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter street no.",
                                  labelText: "What is street no",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: cityC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter city name",
                                  labelText: "What is your city name",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: provinceC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter province",
                                  labelText: "What is your province",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: TextFormField(
                              controller: countryC,
                              validator: (v) {
                                if (v.length < 4) {
                                  return 'shoulf be more than 4 char.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter country",
                                  labelText: "What is your country name",
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    submit();
                  },
                  child: Icon(
                    (Icons.navigate_next),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
