import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text('Reset'),
          onPressed: () {
            sd.resetEverything();
          },
        ),
      ),
    );
  }
}
