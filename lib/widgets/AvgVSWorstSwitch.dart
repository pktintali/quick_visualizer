import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class AvgVSWorstSwitch extends StatelessWidget {
  const AvgVSWorstSwitch({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => sd.option != 3
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Avg/Best vs Worst Graph'),
                  CupertinoSwitch(
                    value: sd.worstGraph,
                    onChanged: (v) {
                      sd.toogleWorstGraph();
                    },
                  ),
                ],
              ),
            )
          : SizedBox(height: 60),
    );
  }
}
