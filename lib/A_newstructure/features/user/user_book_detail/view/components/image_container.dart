import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  const ImageContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395.w,
      height: 320.h,
      color: AppColor.Neutral250,
      child: Center(
        child: Container(
          width: 180.w,
          height: 280.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.Neutral400.withValues(alpha: 0.5),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
