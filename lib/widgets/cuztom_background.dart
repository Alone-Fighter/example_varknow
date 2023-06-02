import 'package:flutter/material.dart';

import '../const.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key,required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.white,
                  kLightBlue3,
                ],
                stops: [0, 0.5],
                begin: AlignmentDirectional(-1, -0.87),
                end: AlignmentDirectional(1, 0.87),
              )),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
