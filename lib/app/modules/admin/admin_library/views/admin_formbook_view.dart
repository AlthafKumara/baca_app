import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/utils/validator.dart';
import 'package:baca_app/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/core/widget/chip.dart';
import 'package:baca_app/app/core/widget/textfield.dart';

import 'package:baca_app/app/modules/admin/admin_library/controllers/book_catagory_controller.dart';
import 'package:baca_app/app/modules/admin/admin_library/controllers/form_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class AdminFormbookView extends GetView {
  AdminFormbookView({super.key});

  final formC = Get.find<FormControllerController>();
  final category = Get.find<BookCatagoryController>();
  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.Neutral100,
        centerTitle: true,
        title: Text(
          'Form',
          style: AppTextStyle.heading5(
            fontWeight: AppTextStyle.bold,
            color: AppColor.Neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Form(
          key: formC.formKey,
          child: ListView(
            children: [
              Container(
                width: 395.w,
                height: 320.h,
                color: AppColor.Neutral250,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      formC.pickCoverImage();
                    },
                    child: Obx(() {
                      final image = formC.selectedImage.value;
                      return Container(
                        width: 180.w,
                        height: 280.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.Neutral400.withValues(alpha: 0.5),
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(image),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: image == null
                            ? Center(
                                child: Icon(
                                  Icons.add_box,
                                  color: AppColor.Neutral600,
                                  size: 24.sp,
                                ),
                              )
                            : null,
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                child: Column(
                  children: [
                    CustomTextfield.textFieldLarge(
                      controller: formC.titlecontroller,
                      hintText: "Input title book",
                      label: "Title",
                      keyBoardType: TextInputType.text,
                      isObsecureText: false,
                      validator: validator.validatorTitle,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextfield.textFieldLarge(
                      controller: formC.synopsiscontroller,
                      hintText: "Input the synopsis book",
                      label: "Synopsis",
                      maxLines: 7,
                      keyBoardType: TextInputType.text,
                      isObsecureText: false,
                      validator: validator.validatorSynopsis,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextfield.textFieldLarge(
                      controller: formC.authorcontroller,
                      hintText: "Input book writer",
                      label: "Author",
                      keyBoardType: TextInputType.text,
                      isObsecureText: false,
                      validator: validator.validatorAuthor,
                    ),
                  ],
                ),
              ),
              Divider(color: AppColor.Neutral250, thickness: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category",
                          style: AppTextStyle.body2(
                            color: AppColor.Neutral900,
                            fontWeight: AppTextStyle.medium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),   
                    Obx(() {
                      final list = category.categories;

                      return Wrap(
                        spacing: 6.w,
                        children: List<Widget>.generate(
                          list.length,
                          (index) => CustomChip().filterChip(
                            onTap: () => category.onpress(index),
                            title: list[index].categoryName,
                            selected: category.selectedIndex.value == index,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Divider(color: AppColor.Neutral250, thickness: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
                child: Column(
                  children: [
                    CustomTextfield.textFieldLarge(
                      prefixicon: GestureDetector(
                        onTap: formC.decreament,
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: Image.asset("assets/library/minus.png"),
                        ),
                      ),
                      suffixicon: GestureDetector(
                        onTap: formC.increament,
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: Image.asset("assets/library/add.png"),
                        ),
                      ),
                      controller: formC.stockcontroller,
                      hintText: "0",
                      label: "Book Stock",
                      maxLines: 1,
                      keyBoardType: TextInputType.number,
                      isObsecureText: false,
                      textAlign: TextAlign.center,
                      validator: validator.validatorStock,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
        child: CustomButtonLarge.primarylarge(
          text: "Submit",
          onPressed: () {
            formC.handleSubmit(category.selectedIndex.value);
          },
        ),
      ),
    );
  }
}
