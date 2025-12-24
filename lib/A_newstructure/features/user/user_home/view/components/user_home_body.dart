import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/constants/user_home_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/controllers/user_home_controller.dart';
import 'package:baca_app/A_newstructure/features/user/user_home/view/components/book_card.dart';
import 'package:baca_app/A_newstructure/shared/controllers/get_all_book_controller.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserHomeBody extends StatelessWidget {
  final UserHomeController controller;
  const UserHomeBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bookController = Get.find<GetAllBookController>();
    return ListView(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.Image_card),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.USER_SEARCH);
            },
            child: CustomTextfield.textFieldRounded(
              controller: TextEditingController(),
              enabled: false,
              hintText: UserHome.searchHint,
              prefixicon: SizedBox(
                height: 20.w,
                width: 20.w,
                child: Image.asset(Assets.Icon_search),
              ),
              isObsecureText: false,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    UserHome.recomendationLabel,
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: bookController.obx(
                  (state) {
                    return _buildList(state!);
                  },
                  onLoading: SizedBox(
                    width: 160.w,
                    height: 250.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.Primary500,
                      ),
                    ),
                  ),
                  onError: (error) {
                    return Center(child: Text(error.toString()));
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Divider(color: AppColor.Neutral250, thickness: 8.h),
        SizedBox(height: 32.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    UserHome.scienceLabel,
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: bookController.obx(
                  (state) {
                    final sciencefiction = state!
                        .where(
                          (book) => book.name_category == "Science Fiction",
                        )
                        .toList();
                    return _buildList(sciencefiction);
                  },
                  onLoading: SizedBox(
                    width: 160.w,
                    height: 250.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.Primary500,
                      ),
                    ),
                  ),
                  onError: (error) {
                    return Center(child: Text(error.toString()));
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Divider(color: AppColor.Neutral250, thickness: 8.h),
        SizedBox(height: 32.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    UserHome.comedyLabel,
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: bookController.obx(
                  (state) {
                    final comedy = state!
                        .where((book) => book.name_category == "Comedy")
                        .toList();

                    if (comedy.isEmpty) {
                      return SizedBox(
                        width: 160.w,
                        height: 100.h,
                        child: Center(
                          child: Text(
                            UserHome.empty,
                            style: AppTextStyle.body1(
                              fontWeight: AppTextStyle.medium,
                              color: AppColor.Neutral900,
                            ),
                          ),
                        ),
                      );
                    }
                    return _buildList(comedy);
                  },
                  onLoading: SizedBox(
                    width: 160.w,
                    height: 250.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.Primary500,
                      ),
                    ),
                  ),

                  onError: (error) {
                    return Center(child: Text(error.toString()));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildList(List<BookModel> list) {
    return Row(
      children: list.map((book) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: BookCard(book: book, controller: controller),
        );
      }).toList(),
    );
  }
}
