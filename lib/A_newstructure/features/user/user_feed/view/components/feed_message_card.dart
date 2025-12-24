import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/models/community_model.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/chip_you.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/feed_single_book_card.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/utils/functions/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedMessageCard extends StatelessWidget {
  final CommunityModel community;
  final ProfileModel profile;
  final BookModel? book;
  final void Function()? ontap;
  const FeedMessageCard({
    super.key,
    required this.community,
    required this.profile,
    this.book,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final coprofile = community.profile;
    final cobook = community.book;
    final coreply = community.replies;

    if (coprofile == null) {
      return SizedBox(child: Text("error"));
    }

    final datemessage = DateFormatter.yearMonthDayFormatter(
      datetime: community.createdAt,
    );

    final timemessage = DateFormatter.timeFormatter(
      datetime: community.createdAt,
    );
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: CircleAvatar(
                      backgroundImage: coprofile.photoProfile != null
                          ? NetworkImage(coprofile.photoProfile!)
                          : null,
                      child: coprofile.photoProfile == null
                          ? const Icon(Icons.person)
                          : null,
                    ),
                  ),
                  SizedBox(width: 8.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              coprofile.name,
                              style: AppTextStyle.body1(
                                fontWeight: AppTextStyle.medium,
                                color: AppColor.Neutral900,
                              ),
                            ),
                            if (coprofile.id == profile.id) ...[
                              SizedBox(width: 8.w),
                              ChipYou(),
                            ],
                          ],
                        ),
                        SizedBox(height: 8.h),

                        Text(
                          community.messageText,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.description2(
                            color: AppColor.Neutral900,
                          ),
                        ),
                        cobook != null
                            ? Column(
                                children: [
                                  SizedBox(height: 16.h),
                                  FeedSingleBookCard(book: cobook),
                                ],
                              )
                            : SizedBox(),

                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 16.w,
                                  height: 16.w,
                                  child: Image.asset(Assets.Icon_message),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "${coreply.length} comments",
                                  style: AppTextStyle.body3(
                                    color: AppColor.Neutral400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 12.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  datemessage,
                                  style: AppTextStyle.body3(
                                    color: AppColor.Neutral400,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  timemessage,
                                  style: AppTextStyle.body3(
                                    color: AppColor.Neutral400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Divider(height: 1.w, color: AppColor.Neutral300),
          ],
        ),
      ),
    );
  }
}
