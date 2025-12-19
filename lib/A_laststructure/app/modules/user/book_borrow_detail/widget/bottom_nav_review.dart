import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/utils/validator.dart';
import 'package:baca_app/A_laststructure/app/core/widget/bottom_sheet.dart';
import 'package:baca_app/A_laststructure/app/core/widget/button_large.dart';
import 'package:baca_app/A_laststructure/app/core/widget/textfield.dart';
import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
import 'package:baca_app/A_laststructure/app/modules/user/book_borrow_detail/controllers/add_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavReview extends StatelessWidget {
  final Borrow borrow;
  final reviewC = Get.find<AddReviewController>();

  Validator validator = Validator();
  BottomNavReview({super.key, required this.borrow});

  @override
  Widget build(BuildContext context) {
    return CustomButtonLarge.primarylarge(
      onPressed: () {
        CustomBottomSheet.doubleBottomSheetWidget(
          height: 400,
          title: "Review",
          child: Column(
            children: [
              starReview(),
              SizedBox(height: 24.h),
              CustomTextfield.textFieldLarge(
                enabled: true,
                hintText: "Enter the review message",
                label: "Message",
                maxLines: 5,
                controller: reviewC.messageReviewController,
                keyBoardType: TextInputType.text,
                textAlign: TextAlign.start,
                validator: validator.validatorDescriptionReview,
                isObsecureText: false,
              ),
            ],
          ),
          onPressed: () {
            reviewC.handleReview(borrow.bookId, borrow.id);
          },
          primarybuttonText: "Review",
          secondarybuttonText: "Cancel",
        );
      },
      text: "Review",
      isLoading: false,
    );
  }

  Widget starReview() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          final starIndex = index + 1;
          final isSelected = reviewC.rating.value >= starIndex;

          return GestureDetector(
            onTap: () => reviewC.setRating(starIndex),
            child: Icon(
              Icons.star_rounded,
              size: 50.sp,
              color: isSelected ? Colors.amber : Colors.grey.shade300,
            ),
          );
        }),
      ),
    );
  }
}
