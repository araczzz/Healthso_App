import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentNavIndex = 0.obs;
  void changePage(int index) {
    currentNavIndex.value = index;
  }
}
