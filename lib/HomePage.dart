import 'package:flutter/material.dart';
import 'package:quick_visualizer/Chart.dart';
import 'package:quick_visualizer/bubbleSort.dart';
import 'dart:math';
import 'package:quick_visualizer/quickSort.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        value,
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 1200),
    ));
  }

  int option = 1;
  String name = 'Quick Sort';
  var r = new Random();
  String timeMsgQuick = '';
  String timeMsgBubble = '';
  var timeinMilliQuick;
  var timeinMilliBubble;
  List<int> randomArray = <int>[];
  List<int> randomArraySorted = <int>[];
  List<LinearSales> dataQuick = [
    LinearSales(0, 0),
  ];
  List<LinearSales> dataBubble = [
    LinearSales(0, 0),
  ];
  var n;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropdownButton(
                    value: option,
                    onChanged: (v) {
                      setState(() {
                        option = v;
                        dataQuick = [
                          LinearSales(0, 0),
                        ];
                        dataBubble = [
                          LinearSales(0, 0),
                        ];
                        timeMsgBubble = '';
                        timeMsgQuick = '';
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('Quick Sort'),
                        onTap: () {
                          name = 'Quick Sort';
                        },
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Buubble Sort'),
                        onTap: () {
                          name = 'Buubble Sort';
                        },
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Quick vs Bubble'),
                        onTap: () {
                          name = 'Quick vs Bubble';
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
                  Text(
                    name + ' Visualizer',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextFormField(
                        onChanged: (e) {
                          n = e;
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Input Size of Array',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Generate Array'),
                          ),
                          onPressed: () {
                            n == null
                                ? showInSnackBar('Size Can Not Be Empty')
                                : print('0');
                            setState(() {
                              n != null
                                  ? randomArray = List<int>.generate(
                                      int.parse(n), (i) => r.nextInt(100))
                                  : print('0');
                            });
                            n != null
                                ? showInSnackBar('Array Created')
                                : print('0');
                          },
                        ),
                        randomArray.length > 0
                            ? RaisedButton(
                                hoverColor: Colors.green.shade400,
                                color: Colors.greenAccent,
                                onPressed: () {
                                  setState(() {
                                    handleSort();
                                  });
                                  showInSnackBar('Array Sorted');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Sort'),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Timetaken (Ms) ⬆'),
                      option == 1 || option == 3
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    timeMsgQuick,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.green),
                                  ),
                                ),
                                Container(
                                  width: 380,
                                  height: 260,
                                  child:
                                      SimpleLineChart.withSampleData(dataQuick),
                                ),
                              ],
                            )
                          : Container(),
                      option == 3
                          ? SizedBox(
                              width: 50,
                            )
                          : Container(),
                      option == 2 || option == 3
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    timeMsgBubble,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.green),
                                  ),
                                ),
                                Container(
                                  width: 380,
                                  height: 260,
                                  child: SimpleLineChart.withSampleData(
                                      dataBubble),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                  Text('No of Elements in Array  ➡'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          dataQuick = [
                            LinearSales(0, 0),
                          ];
                          dataBubble = [
                            LinearSales(0, 0),
                          ];
                          randomArray = [];
                          timeMsgQuick = '';
                          timeMsgBubble = '';
                        });
                      },
                    ),
                  ),
                  randomArray.length > 0 && randomArray.length <= 200
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 500,
                            child: GridView.count(
                              crossAxisCount: 25,
                              children: randomArray
                                  .map((num) => Text(num.toString()))
                                  .toList(),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 50),
                  Text(
                    'Developed By - Pradeep Tintali 🤩',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleSort() {
    if (option == 1 || option == 3) {
      Stopwatch stopWatch1 = new Stopwatch()..start();
      randomArraySorted = QuickSort().sort(randomArray);
      timeMsgQuick = "Quick Sorted in " +
          stopWatch1.elapsed.inSeconds.toString() +
          " Seconds/ " +
          stopWatch1.elapsed.inMilliseconds.toString() +
          "  MilliSeconds/ " +
          stopWatch1.elapsed.inMicroseconds.toString() +
          ' MicroSeconds';
      timeinMilliQuick = stopWatch1.elapsed.inMilliseconds;
      stopWatch1.stop();
      stopWatch1.reset();
      dataQuick.add(
        LinearSales(int.parse(n), timeinMilliQuick),
      );
    }
    if (option == 2 || option == 3) {
      Stopwatch stopWatch2 = new Stopwatch()..start();
      randomArraySorted = BubbleSort().bubbleSort(randomArray);
      timeMsgBubble = "Bubble Sorted in " +
          stopWatch2.elapsed.inSeconds.toString() +
          " Seconds/ " +
          stopWatch2.elapsed.inMilliseconds.toString() +
          " MilliSeconds/ " +
          stopWatch2.elapsed.inMicroseconds.toString() +
          ' MicroSeconds';
      timeinMilliBubble = stopWatch2.elapsed.inMilliseconds;
      stopWatch2.stop();
      stopWatch2.reset();
      dataBubble.add(
        LinearSales(int.parse(n), timeinMilliBubble),
      );
    }
  }
}
