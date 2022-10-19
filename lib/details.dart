// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
String group;
   DetailsScreen({
    Key? key,
    required this.group,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(group),),
    );
  }
}
