import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application_full/models/categories.dart';
import 'package:e_commerce_application_full/screens/products/productspage.dart';
import 'package:e_commerce_application_full/utils/constants.dart';
import 'package:e_commerce_application_full/utils/decoration.dart';
import 'package:e_commerce_application_full/widgets/app_drawer.dart';
import 'package:e_commerce_application_full/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  static const id = "mainpage";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Category> newList = List.from(categories);
  TextEditingController searchC = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchC.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              decoration: decoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: searchC,
                  onChanged: (value) {
                    setState(() {
                      value = searchC.text;
                      newList = categories
                          .where((e) => e.name.contains(value))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Search Category...',
                      suffixIcon: Icon(FontAwesomeIcons.search)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CSlider(),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "CATEGORIES",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: newList
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(ProductPage.id,
                                arguments: {
                                  "category": e.name,
                                  "icon": e.icon
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.blue],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )),
                                  Icon(
                                    e.icon,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
