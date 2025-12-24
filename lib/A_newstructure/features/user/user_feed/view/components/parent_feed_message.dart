import 'package:baca_app/A_newstructure/features/user/user_feed/models/community_model.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/chip_you.dart';
import 'package:baca_app/A_newstructure/features/user/user_feed/view/components/feed_single_book_card.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/utils/functions/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentFeedMessage extends StatelessWidget {
  final CommunityModel community;
  final ProfileModel profile;
  const ParentFeedMessage({
    super.key,
    required this.community,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final parentprofile = community.profile;
    final book = community.book;

    final timeago = DateFormatter.timeAgo(
      datetime: community.createdAt.toLocal(),
    );
    print('createdAt: ${community.createdAt}, now: ${DateTime.now()}');

    if (parentprofile == null) {
      return const SizedBox(child: Text("error"));
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: CircleAvatar(
                        backgroundImage: parentprofile.photoProfile != null
                            ? NetworkImage(parentprofile.photoProfile!)
                            : null,
                        child: parentprofile.photoProfile == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      parentprofile.name,
                      style: AppTextStyle.body1(
                        fontWeight: AppTextStyle.medium,
                        color: AppColor.Neutral900,
                      ),
                    ),
                    if (parentprofile.id == profile.id) ...[
                      SizedBox(width: 8.w),
                      ChipYou(),
                    ],
                  ],
                ),
                Text(
                  timeago,
                  style: AppTextStyle.body3(
                    color: AppColor.Neutral400,
                    fontWeight: AppTextStyle.regular,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.Neutral250,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    community.messageText,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.description2(
                      color: AppColor.Neutral900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          book != null
              ? Column(
                  children: [
                    SizedBox(height: 16.h),
                    FeedSingleBookCard(book: book),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
