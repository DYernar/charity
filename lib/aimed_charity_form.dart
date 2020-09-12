import 'dart:io';

import 'package:charity/app_bar.dart';
import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'charity_types.dart';

class AimedCharityForm extends StatefulWidget {
  @override
  _AimedCharityFormState createState() => _AimedCharityFormState();
}

class _AimedCharityFormState extends State<AimedCharityForm> {
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
      appBar: vkAppBar(context, 'Целевой сбор', true, 0),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40.0),
          right: ScreenUtil().setWidth(40.0),
          top: ScreenUtil().setHeight(4.0),
        ),
        child: Column(
          children: [
            imageFile == null ? imagePickerWidget() : Image.file(imageFile),

            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            inputField('Название сбора', 'Название сбора', 1),
            inputField('Сумма ₽', 'Сколько нужно собрать?', 1),
            inputField('Цель', 'Например, лечение человека', 1),
            inputField(
                'Цель', 'На что пойдут деньги и как они кому-то помогут?', 2),
            // inputField('Куда получать деньги', 'Например, лечение человека', 1),
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            paymentMethod(),

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

  Widget inputField(String title, String hintText, int lines) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15.0)),
      height: ScreenUtil().setHeight(lines == 1 ? 180.0 : 230.0),
      width: double.infinity,
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
            height: ScreenUtil().setHeight(lines == 1 ? 120.0 : 170.0),
            child: TextField(
              maxLines: lines,
              style: blankText.apply(
                color: Colors.black,
                fontWeightDelta: 1,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: '$hintText',
                filled: true,
                fillColor: vkLightGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(
                    color: vkHardGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethod() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Как получать деньги',
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
                value: 'Счет VK Pay 1234',
                icon: Icon(
                  FontAwesomeIcons.angleDown,
                  color: vkHardGrey,
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (_) {},
                items: <String>[
                  'Счет VK Pay 1234',
                  'Счет VK Pay 122314',
                  'Счет VK Pay 123466',
                  'Счет VK Pay 1234787'
                ].map<DropdownMenuItem<String>>((String value) {
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
        ],
      ),
    );
  }

  Widget imagePickerWidget() {
    return GestureDetector(
      onTap: () {
        pickImageFromGallery(ImageSource.gallery);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12.0),
        color: vkMainColor,
        strokeWidth: 2.0,
        dashPattern: [8, 4],
        child: Container(
          height: ScreenUtil().setHeight(350.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.images,
                  color: vkMainColor,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(40.0),
                ),
                Text(
                  'Загрузить обложку',
                  style: blankText.apply(
                    color: vkMainColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
