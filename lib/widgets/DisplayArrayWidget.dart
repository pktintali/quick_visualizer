import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class DisplayArrayWidget extends StatelessWidget {
  const DisplayArrayWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) =>
          sd.randomArray.length > 0 && sd.randomArray.length < 200
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 500,
                    child: GridView.count(
                      crossAxisCount: 25,
                      children: sd.randomArray
                          .map((num) => Text(num.toString()))
                          .toList(),
                    ),
                  ),
                )
              : Container(),
    );
  }
}
