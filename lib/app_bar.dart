import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

Widget vkAppBar(
    BuildContext context, String title, bool backBtn, double elevation) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      '$title',
      style: titleFont,
    ),
    iconTheme: IconThemeData(
      color: backBtn ? vkMainColor : Colors.white,
    ),
    leading: backBtn
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            })
        : Container(),
    elevation: elevation,
  );
}

Widget vkButtonNavigator(
    BuildContext context, double width, height, Widget navigateTo) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => navigateTo),
      );
    },
    child: Container(
      width: ScreenUtil().setWidth(
        width,
      ),
      height: ScreenUtil().setHeight(height),
      decoration: BoxDecoration(
        color: vkMainColor,
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            color: Colors.grey,
          )
        ],
      ),
      child: Center(
        child: Text(
          'Создать сбор',
          style: buttonText,
        ),
      ),
    ),
  );
}
