import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/button_large.dart';
import 'package:baca_app/app/core/widget/button_medium.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';
import 'package:baca_app/app/data/model/saved_list_model.dart';
import 'package:baca_app/app/modules/user/library/controllers/library_controller.dart';
import 'package:baca_app/app/modules/user/library/controllers/saved_list_controller.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SavedListContainer extends StatelessWidget {
  final savedC = Get.find<SavedListController>();

  SavedListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return savedC.obx(
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
            return Obx(
              () => cardSavedList(
                state[index],
                onLongPress: () {
                  savedC.selectedItemId.value = state[index].id!;
                },
              ),
            );
          },
        );
      },
      onEmpty: SizedBox(
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
            SizedBox(
              width: 107.w,
              child: CustomButtonLarge.primarylarge(
                onPressed: () {
                  Get.toNamed(Routes.CREATE_SAVED_LIST);
                },
                prefixicon: Icon(
                  Icons.add,
                  color: AppColor.Neutral100,
                  size: 20.w,
                ),
                text: "Create",
              ),
            ),
          ],
        ),
      ),
      onLoading: Center(
        child: CircularProgressIndicator(color: AppColor.Primary500),
      ),
      onError: (error) => Center(child: Text(error.toString())),
    );
  }

  Widget cardSavedList(
    SavedListModel data, {
    required void Function() onLongPress,
  }) {
    final book = data.books;
    final coverUrl = data.books?.coverUrl;
    return GestureDetector(
      onTap: () => book != null
          ? Get.toNamed(Routes.DETAIL_BOOK, arguments: book)
          : null,
      onLongPress: onLongPress,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                color: savedC.selectedItemId.value == data.id
                    ? AppColor.Danger600
                    : AppColor.Neutral300,
                width: savedC.selectedItemId.value == data.id ? 2.w : 1.w,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
              data.listName!,
              style: AppTextStyle.body1(
                fontWeight: AppTextStyle.medium,
                color: AppColor.Neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
