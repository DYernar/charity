import 'package:flutter/material.dart';

import 'dart:io';

import 'package:charity/app_bar.dart';
import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'charity_types.dart';

class AdditionalForm extends StatefulWidget {
  @override
  _AdditionalFormState createState() => _AdditionalFormState();
}

class _AdditionalFormState extends State<AdditionalForm> {
  dynamic group;
  File imageFile;
  ImagePicker imgPicker = new ImagePicker();

  Future pickImageFromGallery(ImageSource source) async {
    final picked = await imgPicker.getImage(source: source);

    setState(() {
      imageFile = File(picked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: vkAppBar(context, 'Дополнительно', true, 0),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40.0),
          right: ScreenUtil().setWidth(40.0),
          top: ScreenUtil().setHeight(4.0),
        ),
        child: Column(
          children: [
            paymentMethod('Автор', 'Матвей Провосудов', ['Матвей Провосудов']),
            SizedBox(
              height: ScreenUtil().setHeight(40.0),
            ),
            vkButtonNavigator(
              context,
              double.infinity,
              120.0,
              SelectType(),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMethod(
      String title, String placeholder, List<String> variants) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: blankText.apply(
              color: Colors.grey[700],
              fontSizeFactor: 0.9,
            ),
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(100.0),
            decoration: BoxDecoration(
              color: vkLightGrey,
              borderRadius: BorderRadius.circular(13.0),
              border: Border.all(
                width: 1,
                color: vkHardGrey,
              ),
            ),
            child: Center(
              child: DropdownButton<String>(
                value: '$placeholder',
                icon: Icon(
                  FontAwesomeIcons.angleDown,
                  color: vkHardGrey,
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (_) {},
                items: variants.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[100],
                        ),
                      ),
                      width: ScreenUtil().setWidth(860.0),
                      height: ScreenUtil().setHeight(120.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(400.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(50.0),
                ),
                Text(
                  'Сбор завершится',
                  style: blankText,
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: group,
                      onChanged: (val) {
                        setState(() {
                          group = val;
                        });
                      },
                    ),
                    Text('Когда соберем сумму')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: group,
                      onChanged: (val) {
                        setState(() {
                          group = val;
                        });
                      },
                    ),
                    Text('Когда соберем сумму')
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(60.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
