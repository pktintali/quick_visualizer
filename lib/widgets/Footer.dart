import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Developed By - Pradeep Tintali 🤩',
      style: TextStyle(color: Colors.grey.shade400),
    );
  }
}
