import 'package:charity/app_bar.dart';
import 'package:charity/charity_types.dart';
import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Charities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920);
    return Scaffold(
      appBar: vkAppBar(context, 'Пожертвования', false, 0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'У вас пока нет сборов.',
              style: blankText,
            ),
            Text(
              'Начните доброе дело.',
              style: blankText,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50.0),
            ),
            vkButtonNavigator(context, 380.0, 100.0, SelectType()),
            SizedBox(
              height: ScreenUtil().setHeight(160.0),
            ),
          ],
        ),
      ),
    );
  }
}
