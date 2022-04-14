import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractoapp/ui/styles/theme.dart';

import '../../styles/palette.dart';

class CustomTextFormFieldGastos extends StatelessWidget {
  const CustomTextFormFieldGastos({
    required this.text,
    required this.controller,
    this.imageRoute,
    this.validator,
    this.onSaved,
    this.onEditingComplete,
    this.maxLength,
    this.onChange,
    this.margin,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.havePrefix = false,
    Key? key,
    this.isEnabled = true,
    this.focusNode,
    this.helper,
    this.maxLines = 1,
    this.customFormatters = const [],
    this.hintText,
  }) : super(key: key);

  final bool havePrefix;
  final bool isEnabled;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  final FocusNode? focusNode;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter> customFormatters;
  final String text;
  final String? helper;
  final String? imageRoute;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final ValueChanged<String>? onChange;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> inputFormatters = [];
    if (customFormatters.isNotEmpty) {
      inputFormatters.addAll(customFormatters);
    }
    if (textInputType == TextInputType.number) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (textInputType == TextInputType.name) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ñ]')));
    }
    if (maxLength != null) {
      inputFormatters.add(LengthLimitingTextInputFormatter(maxLength));
    }
    if (textInputType == TextInputType.text || textInputType == TextInputType.emailAddress) {
      inputFormatters.add(
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ñ#-_.@~;><&%$()=¿?]')),
      );
    }
    return Container(

      margin: margin,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              if (havePrefix)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(imageRoute!, width: 40, height: 40),
                ),
              TextFormField(
                obscureText: obscureText,
                keyboardType: textInputType,
                onEditingComplete: onEditingComplete,
                onSaved: onSaved,
                onChanged: onChange,
                inputFormatters: inputFormatters,
                focusNode: focusNode,
                maxLines: maxLines,
                enabled: isEnabled,
                decoration: InputDecoration(
                  labelText: text,
                  hintText: hintText,
                  focusColor: CustomTheme.secondaryColor,
              
                ),
                controller: controller,
                validator: validator,
              ),
            ],
          ),
          if (helper != null)
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: double.infinity,
              child: Text(
                helper!,
                style: const TextStyle(fontSize: 14, color: Palette.text),
              ),
            )
        ],
      ),
    );
  }
}
