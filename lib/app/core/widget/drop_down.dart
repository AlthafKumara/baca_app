import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropDown {
  CustomDropDown._();
  static Widget dropDown({
    required String? hintText,
    required String? value,
    required List<dynamic> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField2<String>(
      isDense: true,
      items: items.map<DropdownMenuItem<String>>((item) {
        return DropdownMenuItem(
          value: item.toString(),
          child: Text(item.toString()),
        );
      }).toList(),
      iconStyleData: IconStyleData(
        icon: RotatedBox(
          quarterTurns: 3,
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        iconSize: 20.sp,
      ),
      style: AppTextStyle.body2(
        color: AppColor.Neutral900,
        fontWeight: AppTextStyle.regular,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.Neutral100,
        hintText: hintText,
        hintStyle: AppTextStyle.body2(
          color: AppColor.Neutral400,
          fontWeight: AppTextStyle.regular,
        ),
        errorStyle: AppTextStyle.body2(
          color: AppColor.Danger600,
          fontWeight: AppTextStyle.regular,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.Primary400),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.Neutral300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.Neutral300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.Danger500),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.Danger500),
        ),
      ),
      validator: (value) {
        if (validator != null) {
          return validator(value);
        }
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
