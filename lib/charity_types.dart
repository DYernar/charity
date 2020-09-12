import 'package:charity/aimed_charity_form.dart';
import 'package:charity/app_bar.dart';
import 'package:charity/regular_charity_form.dart';
import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: vkAppBar(context, 'Тип сбора', true, 0.5),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(40.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              charityType(
                  context,
                  AimedCharityForm(),
                  FontAwesomeIcons.crosshairs,
                  'Целевой сбор',
                  'Когда есть опредеденная цель'),
              SizedBox(
                height: ScreenUtil().setHeight(30.0),
              ),
              charityType(
                  context,
                  RegularCharityForm(),
                  FontAwesomeIcons.calendarDay,
                  'Регулярный сбор',
                  'Когда есть опредеденная цель'),
            ],
          ),
        ),
      ),
    );
  }

  Widget charityType(
      context, Widget navigateTo, IconData icon, String title, description) {
    return Container(
      height: ScreenUtil().setHeight(170.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: vkLightGrey,
        border: Border.all(
          color: Colors.grey[300],
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            width: ScreenUtil().setWidth(180.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    icon,
                    color: vkMainColor,
                    size: 24.0,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: simpleText,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10.0),
                ),
                Text(
                  '$description',
                  style: blankText.apply(fontSizeFactor: 0.86),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => navigateTo));
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: vkHardGrey,
            ),
          )
        ],
      ),
    );
  }
}
