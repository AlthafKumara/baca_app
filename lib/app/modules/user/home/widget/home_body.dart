import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/textfield.dart';
import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/modules/user/home/controllers/book_controller.dart';
import 'package:baca_app/app/modules/user/home/widget/book_card.dart';
import 'package:baca_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bookController = Get.find<BookController>();
    return ListView(
      children: [
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home/ilustration.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomTextfield.textFieldLarge(
            controller: TextEditingController(),
            enabled: false,
            hintText: "Search any books",
            prefixicon: SizedBox(
              height: 20.w,
              width: 20.w,
              child: Image.asset("assets/appbar/search.png"),
            ),
            isObsecureText: false,
            textAlign: TextAlign.start,
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
                    "Recomendation Book",
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: AppTextStyle.body3(
                      color: AppColor.Neutral400,
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
                    "Science Fiction Book",
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: AppTextStyle.body3(
                      color: AppColor.Neutral400,
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
                    "Comedy Book",
                    style: AppTextStyle.body1(
                      color: AppColor.Neutral900,
                      fontWeight: AppTextStyle.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: AppTextStyle.body3(
                      color: AppColor.Neutral400,
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
                            "Empty Data",
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

  Widget _buildList(List<Book> list) {
    return Row(
      children: list.map((book) {
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: BookCard(
            book: book,
            image: book.coverUrl,
            title: book.title,
            author: book.author,
          ),
        );
      }).toList(),
    );
  }
}
