import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tractoapp/core/constanst/images_constants.dart';
import '../../../core/constanst/ui_constans.dart';
import '../../components/background/background.dart';
import '../../components/botton/botton_action.dart';
import '../../styles/palette.dart';
import '../login/login.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: BackgroundInit(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(UIConstants.buttonHalfSize),
              margin: const EdgeInsets.all(UIConstants.margin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const SizedBox(height: UIConstants.buttonHalfSize),
                  Text(
                    'TractoApp',
                    style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Palette.darkGrey,
                        fontSize: 30,
                        shadows: [
                          Shadow(
                              color: Palette.white.withOpacity(0.2),
                              offset:  const Offset(0, -2),
                              blurRadius: 0.5)
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: max(350, size.height * 0.3),
                    child: Lottie.asset(ImagesConstants.othericoninit),
                  ),
                  const Spacer(),
                  CustomRaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Login.route,
                      );
                    },
                    text: 'Inicia tu viaje',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
