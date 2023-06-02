import 'package:example_varknow/const.dart';
import 'package:example_varknow/screens/signup1/screen_helper/pageveiw1.dart';
import 'package:example_varknow/screens/signup1/screen_helper/pageveiw2.dart';
import 'package:example_varknow/widgets/custom_container.dart';
import 'package:example_varknow/widgets/cuztom_background.dart';
import 'package:example_varknow/widgets/title_screen.dart';
import 'package:flutter/material.dart';
import '../../styles.dart';

class SignUp1Screen extends StatelessWidget {
  const SignUp1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title('Sign up to get \nstarted',
                'Enter your details to proceed further'),
            customContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelStyle: txt.txtFontFamilyTextField.txtBold,
                            labelColor: Colors.grey,
                            indicatorColor: kLightBlue3,
                            tabs: const [
                              Tab(
                                text: 'Regular account',
                              ),
                              Tab(
                                text: 'Business account',
                              ),
                            ],
                          ),
                          h(10),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                PageView1(),
                                PageView2(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  h(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
