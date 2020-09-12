import 'dart:io';

import 'package:charity/additional_screen.dart';
import 'package:charity/app_bar.dart';
import 'package:charity/statics/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'charity_types.dart';

class RegularCharityForm extends StatefulWidget {
  @override
  _RegularCharityForm createState() => _RegularCharityForm();
}

class _RegularCharityForm extends State<RegularCharityForm> {
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
      appBar: vkAppBar(context, 'Регулярный сбор', true, 0),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(40.0),
          right: ScreenUtil().setWidth(40.0),
          top: ScreenUtil().setHeight(4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageFile == null
                ? imagePickerWidget()
                : Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: ScreenUtil().setHeight(350.0),
                        ),
                      ),
                      Positioned(
                        right: ScreenUtil().setWidth(10.0),
                        top: ScreenUtil().setHeight(10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              imageFile = null;
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.timesCircle,
                            color: vkHardGrey,
                          ),
                        ),
                      )
                    ],
                  ),
            inputField('Название сбора', 'Название сбора', 1),
            inputField('Сумма в месяц, ₽', 'Сколько нужно в месяц?', 1),
            inputField('Цель', 'Например, поддержка приюта', 1),
            inputField('Описание',
                'На что пойдут деньги и как они кому-то помогут?', 2),
            paymentMethod('Как получать деньги', 'Счет VK Pay 1234', [
              'Счет VK Pay 1234',
              'Счет VK Pay 122314',
              'Счет VK Pay 123466',
              'Счет VK Pay 1234787'
            ]),
            paymentMethod('Автор', 'Матвей Правосудов', ['Матвей Правосудов']),
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            ),
            vkButtonNavigator(
              context,
              double.infinity,
              120.0,
              AdditionalForm(),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30.0),
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(String title, String hintText, int lines) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15.0)),
      height: ScreenUtil().setHeight(lines == 1 ? 180.0 : 220.0),
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
          height: ScreenUtil().setHeight(300.0),
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
