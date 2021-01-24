import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/utils/chart.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';
import 'package:quick_visualizer/utils/deviceWidth.dart';

class MasterGraphWidget extends StatelessWidget {
  const MasterGraphWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SwitchData>(
      builder: (context, sd, __) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isSmallDevice(context) ? '' : 'Timetaken (Ms) ⬆'),
              sd.option == 1 || sd.option == 3
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            isSmallDevice(context)
                                ? sd.timeMsg1.length > 0
                                    ? sd.timeMsg1.substring(0, 26)
                                    : ''
                                : sd.timeMsg1,
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                        isSmallDevice(context)
                            ? Text(
                                isSmallDevice(context)
                                    ? sd.timeMsg1.length > 0
                                        ? sd.timeMsg1
                                            .substring(26, sd.timeMsg1.length)
                                        : ''
                                    : sd.timeMsg1,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              )
                            : Container(),
                        Container(
                          width: isSmallDevice(context) ? 260 : 380,
                          height: 260,
                          child: SimpleLineChart.withSampleData(sd.data),
                        ),
                        sd.worstGraph
                            ? Text('Best/Avg Case Graph')
                            : Container(),
                      ],
                    )
                  : Container(),
              sd.option == 3 && !isSmallDevice(context)
                  ? SizedBox(
                      width: 50,
                    )
                  : Container(),
              sd.worstGraph && !isSmallDevice(context)
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sd.timeMsg3,
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                        ),
                        Container(
                          width: isSmallDevice(context) ? 260 : 380,
                          height: 260,
                          child: SimpleLineChart.withSampleData(
                              sd.option == 1 ? sd.data2 : sd.data),
                        ),
                        Text(sd.option == 1
                            ? 'Worst Case Graph'
                            : 'Best Case graph'),
                      ],
                    )
                  : Container(),
              !isSmallDevice(context) && (sd.option == 2 || sd.option == 3)
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            //Bubble
                            sd.timeMsg2,
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ),
                        ),
                        Container(
                          width: isSmallDevice(context) ? 260 : 380,
                          height: 260,
                          child: SimpleLineChart.withSampleData(sd.data2),
                        ),
                        sd.worstGraph ? Text('Avg Case Graph') : Container(),
                      ],
                    )
                  : Container(),
            ],
          ),
          isSmallDevice(context)
              ? Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    sd.worstGraph
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  sd.timeMsg3,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                              ),
                              Container(
                                width: isSmallDevice(context) ? 260 : 380,
                                height: 260,
                                child: SimpleLineChart.withSampleData(
                                    sd.option == 1 ? sd.data2 : sd.data),
                              ),
                              Text(sd.option == 1
                                  ? 'Worst Case Graph'
                                  : 'Best Case graph'),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Container(),
                    (sd.option == 2 || sd.option == 3)
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  //Bubble
                                  sd.timeMsg2,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.green),
                                ),
                              ),
                              Container(
                                width: isSmallDevice(context) ? 260 : 380,
                                height: 260,
                                child: SimpleLineChart.withSampleData(sd.data2),
                              ),
                              sd.worstGraph
                                  ? Text('Avg Case Graph')
                                  : Container(),
                            ],
                          )
                        : Container(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
