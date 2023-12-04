import 'package:flutter/material.dart';
import 'package:jsondecode/model/bhagvat.dart';

class more extends StatefulWidget {

  String bhagvat;
  const more({super.key, required bhagvat bhagvat});

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(e.name)),
    );
  }
}
