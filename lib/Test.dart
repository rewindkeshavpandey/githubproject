import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            buildContainer(
                150, 200, "", null, Colors.green, 0, const EdgeInsets.all(20)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildContainer(
                  MediaQuery.of(context).size.height - 520,
                  200,
                  "suman",
                  Icons.roofing,
                  Colors.blue,
                  40,
                  const EdgeInsets.all(20)),
            ),
            buildContainer(120, 200, "text", Icons.call, Colors.yellow, 20,
                const EdgeInsets.only(top: 50))
          ],
        )),
      ),
    );
  }
}

Widget buildContainer(
    height, width, String text, icon, Color color, font, padding) {
  return Container(
    decoration: BoxDecoration(color: color),
    height: height,
    width: width,
    child: Row(
      children: [
        Padding(
          padding: padding,
          child: Icon(icon),
        ),
        Text(
          text,
          style: TextStyle(fontSize: font),
        ),
      ],
    ),
  );
}
