import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_visualizer/HomePage.dart';
import 'package:quick_visualizer/providers/SwitchData.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SwitchData()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
