import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'charities_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Charities(),
    );
  }
}
