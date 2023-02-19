
import 'package:flutter/material.dart';

class ExceptionHandler {
  factory ExceptionHandler() {
    return _singleton;
  }

  ExceptionHandler._internal();

  static final ExceptionHandler _singleton = ExceptionHandler._internal();

  Future<bool> handle(BuildContext context, dynamic ex) async {


    if (ex.toString().contains("template_error")) {
      // showToast(tr("template_error_is_showing"));
      return true;
    }
  

    return false;
  }

  String removeIncorrectWords(String exception) {
    var message = exception
        .replaceAll("exception:", "")
        .replaceAll("exception: ", "")
        .replaceAll("invalid_grant,", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .trim();
    return message;
  }
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
}
