import 'package:get/get.dart';
import 'package:tekno_expo/model/user.dart';

class AccountController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  Rx<User> user = User().obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  void fetchApi() async {
    try {
      isLoading(true);
      user.value = await User.getUser();
    } catch (e) {
      isError(true);
      errorMassage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
