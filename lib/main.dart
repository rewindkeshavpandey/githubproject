import 'package:flutter/material.dart';
import 'package:githubproject/complain_form.dart';
import 'package:githubproject/home_page.dart';

import 'file_picker.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:FilePickerDemo()
    );
  }
}
