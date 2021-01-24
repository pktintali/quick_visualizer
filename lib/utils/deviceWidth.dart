import 'package:flutter/material.dart';

bool isSmallDevice(BuildContext context) =>
    MediaQuery.of(context).size.width < 1200;
