import 'package:flutter/material.dart';
import 'package:ui_project/file_compressor.dart';
import 'package:ui_project/invoice.dart';
import 'package:ui_project/quotation3.dart';
import 'package:ui_project/select_audio.dart';
import 'package:ui_project/video_image_compressor.dart';
import 'home.dart';
import 'image_download.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  //th This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: false,
      
    ), home: SelectAudio());
  }
}
