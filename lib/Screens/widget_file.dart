import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Config/app_strings.dart';

abstract class WidgetFile {
  static Widget customTextField(
      {required String hintText,
        required TextEditingController control,
        void Function(String)? onChanged, bool? valid}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: control,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
        errorText: valid! ? AppStrings.errorMsgNumber : null,
      ),
      onChanged: onChanged,
    );
  }

  static Widget nextButton({
    required String text,
    required Function() onPressed,
    double? fontSize,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800 )) ,
    );
  }

  static Widget gridviewBoxButton(
      {String? text,
        required void Function()? onPressed,
        ButtonStyle? style,
        bool? buttonIs = true}) {
    return ElevatedButton(
      autofocus: true,
      style: style,
      onPressed: onPressed,
      child: Text(text!),
    );
  }

  static Widget customText(
      {required String data,
        double? fontSize,
        String? fontFamily,
        FontWeight? fontWeight,
        TextAlign? textAlign}) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }

  static Widget customTextButton(
      {required String data, required void Function()? onPressed, MaterialStateProperty<Color?>? fgdColor,  }) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(foregroundColor: fgdColor ),
      child: Text(data),
    );
  }
}
