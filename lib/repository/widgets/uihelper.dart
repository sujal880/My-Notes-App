import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      bool toHide, TextInputType textinputtype) {
    return Container(
      height: 45.h,
      width: 300.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color(0XFFF1F4FF),
          border: Border.all(color: const Color(0XFF213BC5))),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, top: 2.h),
        child: TextField(
          controller: controller,
          keyboardType: textinputtype,
          obscureText: toHide,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(fontSize: 15.sp),
              border: InputBorder.none),
        ),
      ),
    );
  }

  static CustomImage(
      {required String imgurl,
      required double height,
      bool isnetwork = false}) {
    return isnetwork
        ? Image.network(imgurl, fit: BoxFit.cover, height: height)
        : Image.asset(
            imgurl,
            fit: BoxFit.cover,
            height: height,
          );
  }

  static CustomText(
      {required String text,
      required double fontsize,
      Color? color,
      required String fontfamily}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight:
              fontfamily == "Bold" ? FontWeight.bold : FontWeight.normal,
          fontFamily: fontfamily,
          color: color ?? Color(0XFF000000)),
    );
  }

  static CustomButton({required VoidCallback callback, required String text}) {
    return SizedBox(
      height: 45.h,
      width: 300.w,
      child: ElevatedButton(
          onPressed: () {
            callback();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFF213BC5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          child: Text(
            text,
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          )),
    );
  }

  static CustomTextButton(
      {required VoidCallback callback, required String text, Color? color}) {
    return TextButton(
        onPressed: () {
          callback();
        },
        child: Text(
          text,
          style: TextStyle(color: color ?? Color(0XFF213BC5), fontSize: 14.sp),
        ));
  }

  static CustomSnackBar(BuildContext context,String text){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),backgroundColor: Color(0XFF213BC5),));
  }
}
