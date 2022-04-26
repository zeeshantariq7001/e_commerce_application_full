import 'package:flutter/material.dart';

Padding padding() {
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 15));
}

BoxDecoration decoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.withOpacity(0.3));
}
