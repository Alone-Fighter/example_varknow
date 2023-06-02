import 'package:flutter/material.dart';

Widget customContainer(Widget child){

  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.center,
      width: 600,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25)),
          color: Colors.white),
      child: child,
    ),
  );
}