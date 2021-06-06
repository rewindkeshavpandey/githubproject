


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDeleted = false;
  bool _isdeleted =false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
              _isDeleted
                  ? Container()
                  : Row(
                      children: [
                        Chip(
                          label: Text("EMINEM"),
                          onDeleted: () {
                            setState(() {
                              _isDeleted = true;
                            });
                          },
                        ),
                      ],
                    ),
                     _isdeleted
                  ? Container()
                  : Row(
                      children: [
                        Chip(
                          label: Text("suman"),
                          onDeleted: () {
                            setState(() {
                              _isdeleted = true;
                            });
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
