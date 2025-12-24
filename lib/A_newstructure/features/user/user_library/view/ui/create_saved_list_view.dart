import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_library/controllers/user_library_saved_list_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/button_large.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:baca_app/A_newstructure/utils/functions/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateSavedListView extends GetView<UserLibrarySavedListController> {
  final libraryC = Get.find<UserLibraryController>();
  CreateSavedListView({super.key});

  final validator = Validator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          iconSize: 24.w,
          color: AppColor.Neutral900,
        ),
        title: Text(
          'New Saved List',
          style: AppTextStyle.body1(
            fontWeight: AppTextStyle.semiBold,
            color: AppColor.Neutral900,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Form(
          key: controller.savelistkey,
          child: Column(
            children: [
              CustomTextfield.textFieldLarge(
                controller: controller.listnameC,
                label: "Save List Name",
                enabled: true,
                hintText: "Input save list name",
                keyBoardType: TextInputType.text,
                validator: validator.validatorListName,
                textAlign: TextAlign.start,
                isObsecureText: false,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
        child: CustomButtonLarge.primarylarge(
          text: "Create",
          onPressed: () {
            controller.handlecreateSavedList();
          },
        ),
      ),
    );
  }
}
