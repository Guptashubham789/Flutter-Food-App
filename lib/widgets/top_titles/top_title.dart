import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kToolbarHeight + 12,
        ),
        if (title == "Login" || title == "Create Account")
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Text(subtitle),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
