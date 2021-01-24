import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quick_visualizer/utils/bubbleSort.dart';
import 'package:quick_visualizer/utils/chart.dart';
import 'package:quick_visualizer/utils/quickSort.dart';

class SwitchData with ChangeNotifier {
  String name = 'Quick Sort';
  String timeMsg1 = '';
  String timeMsg2 = '';
  String timeMsg3 = '';
  int option = 1;
  var inputNum;
  var sortTimeMS;
  var sortTimeMS2;
  List<int> randomArray = [];
  List<int> sortedArray = [];
  List<int> tempRArray = [];
  List<LinearSales> data = [
    LinearSales(0, 0),
  ];
  List<LinearSales> data2 = [
    LinearSales(0, 0),
  ];
  bool worstGraph = false;
  bool isLoading = false;
  set setInput(var v) => inputNum = v;
  void setOption(int opt) {
    option = opt;
    notifyListeners();
  }

  void setData(List<LinearSales> graphData) {
    data = graphData;
    notifyListeners();
  }

  void setTimeMsg(String tmsg) {
    timeMsg1 = tmsg;
    notifyListeners();
  }

  void setName(String nam) {
    name = nam;
    notifyListeners();
  }

  void toogleWorstGraph() {
    worstGraph = !worstGraph;
    notifyListeners();
  }

  void toogleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void generateRA() {
    var r = new Random();
    randomArray = List<int>.generate(
      int.parse(inputNum),
      (i) => r.nextInt(100),
    );
    tempRArray = randomArray.toList();
    notifyListeners();
  }

  void generateSA() {
    sortedArray = List<int>.generate(int.parse(inputNum), (i) => i);
    notifyListeners();
  }

  void handleSort() {
    try {
      if (option == 1 || option == 3) {
        final stopWatch = Stopwatch()..start();
        QuickSort().sort(randomArray);
        stopWatch.stop();
        timeMsg1 = "Quick Sorted in " +
            stopWatch.elapsed.inSeconds.toString() +
            " Seconds/ " +
            stopWatch.elapsed.inMilliseconds.toString() +
            "  MilliSeconds/ " +
            stopWatch.elapsed.inMicroseconds.toString() +
            ' MicroSeconds';
        sortTimeMS = stopWatch.elapsed.inMilliseconds;
        stopWatch.reset();
        data.add(
          LinearSales(int.parse(inputNum), sortTimeMS),
        );
      }
      if (option == 2 || option == 3) {
        final stopWatch2 = Stopwatch()..start();
        BubbleSort().bubbleSort(tempRArray);
        stopWatch2.stop();
        timeMsg2 = "Bubble Sorted in " +
            stopWatch2.elapsed.inSeconds.toString() +
            " Seconds/ " +
            stopWatch2.elapsed.inMilliseconds.toString() +
            " MilliSeconds/ " +
            stopWatch2.elapsed.inMicroseconds.toString() +
            ' MicroSeconds';
        sortTimeMS2 = stopWatch2.elapsed.inMilliseconds;
        stopWatch2.reset();
        data2.add(
          LinearSales(int.parse(inputNum), sortTimeMS2),
        );
      }
      if (worstGraph && option != 3) {
        final stopWatch1 = Stopwatch()..start();
        sortedArray = option == 1
            ? QuickSort().sort(sortedArray)
            : BubbleSort().bubbleSort(sortedArray);
        stopWatch1.stop();
        timeMsg3 = "Sorted in " +
            stopWatch1.elapsed.inSeconds.toString() +
            " Seconds/ " +
            stopWatch1.elapsed.inMilliseconds.toString() +
            "  MilliSeconds/ " +
            stopWatch1.elapsed.inMicroseconds.toString() +
            ' MicroSeconds';
        if (option == 1) {
          sortTimeMS2 = stopWatch1.elapsed.inMilliseconds;
        } else if (option == 2) {
          sortTimeMS = stopWatch1.elapsed.inMilliseconds;
        }

        stopWatch1.reset();
        option == 1
            ? data2.add(LinearSales(int.parse(inputNum), sortTimeMS2))
            : data.add(LinearSales(int.parse(inputNum), sortTimeMS));
      }
    } catch (e) {
      print(e);
    }
  }

  void resetEverything() {
    data = [
      LinearSales(0, 0),
    ];
    data2 = [
      LinearSales(0, 0),
    ];
    timeMsg1 = '';
    timeMsg2 = '';
    timeMsg3 = '';
    // inputNum = null;
    sortTimeMS = null;
    sortTimeMS2 = null;
    randomArray = [];
    sortedArray = [];
    worstGraph = false;
    isLoading = false;
    notifyListeners();
  }
}
