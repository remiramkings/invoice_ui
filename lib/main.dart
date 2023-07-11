import 'package:flutter/material.dart';
import 'package:ui_project/file_compressor.dart';
import 'package:ui_project/invoice.dart';
import 'package:ui_project/quotation3.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  //th This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(
      primarySwatch: Colors.blue
    ), home: FileCompressor());
  }
}
