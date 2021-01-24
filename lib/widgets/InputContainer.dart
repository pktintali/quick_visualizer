import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => Container(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: TextFormField(
            onChanged: (e) {
              sd.setInput = e;
              //var n = e
            },
            // autofocus: true,
            decoration: InputDecoration(
              labelText: 'Input Array Size',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
