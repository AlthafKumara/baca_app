import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/notification/controllers/notification_controller.dart';
import 'package:baca_app/A_newstructure/features/notification/models/notification_model.dart';
import 'package:baca_app/A_newstructure/features/notification/view/components/notification_card.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Get.back(),
        ),
        title: Text(
          'Notification',
          style: AppTextStyle.body1(
            color: AppColor.Neutral900,
            fontWeight: AppTextStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: controller.obx(
          (notifications) {
            if (notifications == null || notifications.isEmpty) {
              return const Center(child: Text('No notifications'));
            }

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCard(
                  notification: notification,
                  onTap: () {
                    if (notification.type == NotificationType.general) {
                      // Get.offAllNamed(Routes.ADMIN_LIBRARY);
                    } else if (notification.type ==
                        NotificationType.community) {
                      controller.toFeed();
                    } else if (notification.type ==
                        NotificationType.borrow_status) {
                      controller.toLibrary();
                    }

                    controller.markAsRead(notification);
                  },
                );
              },
            );
          },
          onLoading: const Center(
            child: CircularProgressIndicator(color: AppColor.Primary500),
          ),
          onEmpty: const Center(child: Text('No notifications')),
          onError: (err) => Center(child: Text(err ?? 'Something went wrong')),
        ),
      ),
    );
  }
}
