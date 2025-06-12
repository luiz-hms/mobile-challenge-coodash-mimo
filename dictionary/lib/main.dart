import 'package:dictionary/core/injector.dart';
import 'package:dictionary/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}
