import 'package:flutter/material.dart';

Widget favouriteWidget() {
  return Row(
    children: [
      Image.asset("pics/north.jpeg", height: 100, width: 100),
      const SizedBox(width: 20),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("The name:"),
          Text("The author name:"),
          Text("Ratings:"),
        ],
      ),
    ],
  );
}
