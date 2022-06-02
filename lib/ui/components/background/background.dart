import 'package:flutter/material.dart';

import '../../../core/constanst/images_constants.dart';

class BackgroundInit extends StatelessWidget {
  const BackgroundInit({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        children.insert(
            0,
            Image.asset(
              ImagesConstants.backgroundInit,
              fit: BoxFit.fill,
              width: constraints.maxWidth,
            ));
        return Stack(
          children: children,
        );
      },
    ));
  }
}

class Background extends StatelessWidget {
  const Background({Key? key, required this.children, required this.appBar}) : super(key: key);

  final List<Widget> children;
  final AppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            children.insert(
                0,
                Image.asset(
                  ImagesConstants.background,
                  fit: BoxFit.fill,
                  width: constraints.maxWidth,
                ));
            return Stack(
              children: children,
            );
          },
        ));
  }
}
