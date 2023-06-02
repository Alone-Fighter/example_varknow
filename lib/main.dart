import 'dart:developer';

import 'package:example_varknow/provider/signup1_provider.dart';
import 'package:example_varknow/provider/signup2_provider.dart';
import 'package:example_varknow/provider/signup3_provider.dart';
import 'package:example_varknow/screens/signup1/signup1_screen.dart';
import 'package:example_varknow/screens/signup2/signup2_screen.dart';
import 'package:example_varknow/screens/signup3/signup3_screen.dart';
import 'package:example_varknow/screens/signup4/signup4_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUp1Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUp2Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUp3Provider(),
        ),
      ],
      child: VRouter(
        initialUrl: '/signup',
        routes: [
          VWidget(path: '/', widget: const MyApp()),
          VWidget(path: '/signup', widget: SignUp1Screen()),
          VWidget(path: '/signup3', widget: const SignUp3Screen()),
          VWidget(path: '/signup4', widget: const SignUp4Screen()),
          VWidget(path: '/signup2', widget: const SignUp2Screen()),
        ],
      ),
    )

  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SignUp1Screen());
  }
}
