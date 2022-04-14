import 'package:flutter/material.dart';

import '../../../core/constanst/ui_constans.dart';
import '../../styles/palette.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    required this.onPressed,
    required this.text,
    this.color = Palette.tractoGreen,
    Key? key,
    this.width = double.infinity,
    this.colorText = Palette.black,
    this.shape,
    this.fontSize,
    this.isLoading = false,
    this.isEnable = true,
  }) : super(key: key);

  final double width;
  final String text;
  final Color colorText;
  final Color color;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? fontSize;
  final bool isLoading;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: UIConstants.buttonSize,
      child: Opacity(
        opacity: isEnable ? 1.0 : 0.2,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: shape).copyWith(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: onPressed,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                  text,
                  style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
