import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Google extends StatelessWidget {
  final String ImagePath;
  const Google({super.key, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      height: 40,
      width: 40,
      child: Image.asset(
        ImagePath,
        // height: 50,
      ),
    );
  }
}
