import 'package:baca_app/app/data/model/community_model.dart';
import 'package:baca_app/app/data/services/communnity_services.dart';
import 'package:get/get.dart';

class GetFeedController extends GetxController
    with StateMixin<List<Community>> {
  final communityServices = CommunnityServices();
  void getParrentFeed() async {
    try {
      final feed = await communityServices.getCommunity();

      change(feed, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    getParrentFeed();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
