import 'package:flutter/material.dart';

class Blue extends StatelessWidget {
  const Blue({super.key,  required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Text('Blue Screen with ID: $id')));
  }
}