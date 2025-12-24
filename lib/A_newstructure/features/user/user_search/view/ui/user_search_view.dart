import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_search/controllers/user_search_book_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_search/controllers/user_search_page_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_search/view/components/search_book_card.dart';
import 'package:baca_app/A_newstructure/features/user/user_search/view/components/search_empty.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserSearchView extends GetView<UserSearchPageController> {
  final bookC = Get.find<UserSearchBookController>();

  UserSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.Neutral100,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24.w,
          ),
        ),

        title: Expanded(
          child: CustomTextfield.textFieldRounded(
            controller: controller.searchcontroller,
            enabled: true,
            hintText: "Search any book",
            prefixicon: Image.asset(Assets.Icon_search, width: 18.w),
            isObsecureText: false,
            keyBoardType: TextInputType.text,
            maxLines: 1,
            validator: (_) => null,
            textAlign: TextAlign.start,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            child: Image.asset(Assets.Icon_filter, width: 24.w),
          ),
        ],
      ),
      body: bookC.obx(
        (state) {
          if (state!.isEmpty) {
            return Center(child: SearchEmpty());
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: ListView(
              children: [
                Text(
                  bookC.isSearched.value
                      ? "Search Result for \"${controller.searchcontroller.text}\""
                      : "All Books",
                  style: AppTextStyle.body1(
                    fontWeight: AppTextStyle.medium,
                    color: AppColor.Neutral900,
                  ),
                ),
                SizedBox(height: 24.h),
                ...state.map((book) => SearchBookCard(book: book)),
              ],
            ),
          );
        },
        onEmpty: Center(child: SearchEmpty()),
        onLoading: Center(
          child: CircularProgressIndicator(color: AppColor.Primary500),
        ),
      ),
    );
  }
}
