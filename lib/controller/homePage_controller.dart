import 'package:get/get.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:tekno_expo/model/user.dart';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  Rx<User> user = User().obs;

  bool get getIsLoading =>
      isLoading.value && Get.find<UserController>().isLoading.value;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }
}
