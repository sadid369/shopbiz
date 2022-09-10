import 'package:flutter/material.dart';

Padding padding() {
  return const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
    ),
  );
}

BoxDecoration decoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(0.3),
  );
}
