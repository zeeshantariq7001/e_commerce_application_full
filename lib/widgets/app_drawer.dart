import 'package:e_commerce_application_full/admin_screens/addproduct.dart';
import 'package:e_commerce_application_full/screens/Mainscree.dart';
import 'package:e_commerce_application_full/utils/custom_colors.dart';
import 'package:e_commerce_application_full/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          children: [
            drawerheader(),
            draweritems("Home Page", FontAwesomeIcons.home, () {
              Navigator.pushReplacementNamed(context, MainPage.id);
            }),
            draweritems("Admin Page", FontAwesomeIcons.user, () {
              Navigator.pushReplacementNamed(context, AddProductPage.id);
            }),
          ],
        ),
      ),
    );
  }

  ListTile draweritems(String title, IconData icon, GestureTapCallback ontap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: ontap,
    );
  }

  DrawerHeader drawerheader() {
    return DrawerHeader(
      padding: EdgeInsets.all(0.0),
      child: Container(
          color: primarycolor,
          child: Center(
              child: Text(
            "Welcome to Shop Biz ",
            textAlign: TextAlign.center,
            style: heading1,
          ))),
    );
  }
}
