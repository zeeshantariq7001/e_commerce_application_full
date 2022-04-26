import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  String name;
  IconData icon;
  Category({this.icon, this.name});
}

List<Category> categories = [
  Category(
    name: "Accessories",
    icon: FontAwesomeIcons.tshirt,
  ),
  Category(
    name: "Auto Mobiles",
    icon: FontAwesomeIcons.car,
  ),
  Category(
    name: "Beauty and Health",
    icon: FontAwesomeIcons.hatCowboy,
  ),
  Category(
    name: "Business and Industrial",
    icon: FontAwesomeIcons.cashRegister,
  ),
  Category(
    name: "Books and Learning",
    icon: FontAwesomeIcons.book,
  ),
  Category(
    name: "Computer and peripherails",
    icon: FontAwesomeIcons.laptop,
  ),
  Category(
    name: "Electronics",
    icon: FontAwesomeIcons.tv,
  ),
];
