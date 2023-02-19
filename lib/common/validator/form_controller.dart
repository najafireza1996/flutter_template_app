import 'package:flutter/material.dart';

class FormController {
  final double position;
  final formkey = GlobalKey<FormState>();
  bool isValid = true;
  FormController(this.position);

  static bool validateAllAndScrollToInvalidOne(
      List<FormController> forms, ScrollController scrollController) {
    for (int i = 0; i < forms.length; i++) {
      forms[i].validate();
    }
    for (int i = 0; i < forms.length; i++) {
      if (forms[i].isValid == false) {
        Future.delayed(const Duration(milliseconds: 200), () {
          scrollController.animateTo(forms[i].position,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        });
        return false;
      }
    }
    return true;
  }

  bool validate() {
    isValid = formkey.currentState!.validate();
    return isValid;
  }
}
