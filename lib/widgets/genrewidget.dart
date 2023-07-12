import 'package:app/Views/listgenre.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget genreWidget() {
  return TextButton(
    onPressed: () {
      Get.to(() => const Pagetwo());
    },
    child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: mainColor,
        ),
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
              "pics/north.jpeg",
              fit: BoxFit.cover,
            )),
            const Text("GENRE"),
          ],
        )),
  );
}