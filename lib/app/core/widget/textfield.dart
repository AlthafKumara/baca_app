import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield {
  CustomTextfield._();

  static Widget textFieldLarge({
    final String? label,
    final String? hintText,
    final Widget? prefixicon,
    final Widget? suffixicon,
    final TextEditingController? controller,
    final bool? isObsecureText,
    final int? maxLines,
    final TextInputType? keyBoardType,
    final bool? enabled,
    String? Function(String?)? validator,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label,
            style: AppTextStyle.body2(
              color: AppColor.Neutral900,
              fontWeight: AppTextStyle.medium,
            ),
          ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          keyboardType: keyBoardType,
          enabled: enabled,
          obscureText: isObsecureText!,
          style: AppTextStyle.body2(
            color: AppColor.Neutral900,
            fontWeight: AppTextStyle.regular,
          ),
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

            prefixIcon: prefixicon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 12, right: 8),
                    child: prefixicon,
                  )
                : null,
            prefixIconConstraints: BoxConstraints(
              minWidth: 20.w,
              minHeight: 20.w,
            ),
            suffixIcon: suffixicon != null
                ? Padding(
                    padding: EdgeInsets.only(left: 8, right: 12),
                    child: suffixicon,
                  )
                : null,
            suffixIconConstraints: BoxConstraints(
              minWidth: 20.w,
              minHeight: 20.w,
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
        ),
      ],
    );
  }
}
