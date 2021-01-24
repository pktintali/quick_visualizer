import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class XSortText extends StatelessWidget {
  const XSortText({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => Text(
        sd.name + ' Visualizer',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
