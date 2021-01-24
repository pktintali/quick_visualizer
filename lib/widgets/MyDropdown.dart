import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

class MyDropdown extends StatelessWidget {
  const MyDropdown({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, switchData, __) => DropdownButton(
        value: switchData.option,
        onChanged: (v) {
          switchData.resetEverything();
          switchData.setOption(v);
        },
        items: [
          DropdownMenuItem(
            child: Text('Quick Sort'),
            onTap: () {
              switchData.setName('Quick Sort');
            },
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('Bubble Sort'),
            onTap: () {
              switchData.setName('Bubble Sort');
            },
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('Quick vs Bubble'),
            onTap: () {
              switchData.setName('Quick vs Bubble');
            },
            value: 3,
          ),
          DropdownMenuItem(
            child: Text('Merge Sort'),
            onTap: () {},
            value: 4,
          ),
          DropdownMenuItem(
            child: Text('Selection Sort'),
            onTap: () {},
            value: 5,
          ),
          DropdownMenuItem(
            child: Text('Heap Sort'),
            onTap: () {},
            value: 6,
          )
        ],
      ),
    );
  }
}
