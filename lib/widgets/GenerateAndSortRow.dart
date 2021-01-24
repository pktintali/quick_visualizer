import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class GenerateAndSortRow extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  GenerateAndSortRow({Key key, this.scaffoldKey}) : super(key: key);
  void showInSnackBar({String value, Color color}) {
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        value,
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: color,
      duration: Duration(milliseconds: 1000),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => !sd.isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Generate Random Array'),
                  ),
                  onPressed: () {
                    if (sd.inputNum == null ||
                        sd.inputNum.toString().length == 0) {
                      showInSnackBar(
                          value: 'Size Can Not Be Empty',
                          color: Colors.deepOrange);
                    } else {
                      sd.generateRA();
                      sd.generateSA();
                    }
                  },
                ),
                sd.randomArray.length > 0
                    ? RaisedButton(
                        hoverColor: Colors.green.shade400,
                        color: Colors.greenAccent,
                        onPressed: () async {
                          sd.toogleLoading();
                          await Future.delayed(Duration(milliseconds: 400));
                          sd.handleSort();
                          showInSnackBar(value: 'Sorted', color: Colors.green);
                          sd.toogleLoading();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Sort'),
                        ),
                      )
                    : Text(''),
              ],
            )
          : CircularProgressIndicator.adaptive(),
    );
  }
}
