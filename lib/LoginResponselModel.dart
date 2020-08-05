import 'package:flutter/material.dart';
class LoginResponselModel {
  String _message;
  String _result;

  LoginResponselModel(this._message, this._result);

  String get result => _result;

  set result(String value) {
    _result = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}
