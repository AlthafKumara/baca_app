import 'package:baca_app/A_newstructure/features/user/user_book_detail/controllers/handle_saved_list_controller.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_saved_list.dart';
import 'package:baca_app/A_newstructure/shared/models/saved_list_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/bottom_sheet.dart';
import 'package:baca_app/A_newstructure/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedBottomSheet {
  final savedC = Get.find<GetSavedList>();
  final handleSavedC = Get.find<HandleSavedListController>();
  void savedBottomsheet({required int bookId}) {
    savedC.getSavedList(savedC.profile.profile.value!.id);

    return CustomBottomSheet.doubleBottomSheetWidget(
      height: 520,
      title: "Add to my save list",
      child: SizedBox(
        height: 350.h,
        child: savedC.obx(
          (state) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 7 / 8,
              ),
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  final list = state[index];
                  final isSelected = savedC.selectedListId.value == list.id;
                  return cardSavedList(
                    list,
                    isSelected: isSelected,
                    onPressed: () {
                      savedC.selectedListId.value = list.id!;
                    },
                  );
                });
              },
            );
          },
          onEmpty: _emptyState(),
          onLoading: Center(
            child: CircularProgressIndicator(color: AppColor.Primary500),
          ),
          onError: (error) => Center(child: Text(error.toString())),
        ),
      ),
      primarybuttonText: "Save",
      secondarybuttonText: "Cancel",
      onPressed: () {
        if (savedC.selectedListId.value == null) {
          CustomSnackbar.failedSnackbar("No Selected List found");
        }

        handleSavedC.handleAddBook(
          listId: savedC.selectedListId.value!,
          bookId: bookId,
        );
      },
    );
  }

  Widget cardSavedList(
    SavedListModel data, {
    required bool isSelected,
    required void Function() onPressed,
  }) {
    final coverUrl = data.books?.coverUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 160.h,
            decoration: BoxDecoration(
              color: AppColor.Neutral200,
              image: coverUrl != null
                  ? DecorationImage(
                      image: NetworkImage(data.books!.coverUrl),
                      fit: BoxFit.cover,
                    )
                  : null,

              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? AppColor.Primary500 : AppColor.Neutral300,
                width: isSelected ? 2.w : 1.w,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          data.listName!,
          style: AppTextStyle.body1(
            fontWeight: AppTextStyle.medium,
            color: AppColor.Neutral900,
          ),
        ),
      ],
    );
  }

  Widget _emptyState() {
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 160.w,
            width: 160.w,
            child: Image.asset("assets/library/ilustration.png"),
          ),
          SizedBox(height: 20.h),
          Text(
            "No Saved List",
            style: AppTextStyle.heading5(
              fontWeight: AppTextStyle.bold,
              color: AppColor.Neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "There is no saved list that you have. You can create a new saved list first.",
            style: AppTextStyle.description2(
              fontWeight: AppTextStyle.regular,
              color: AppColor.Neutral400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
