import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tekno_expo/model/user.dart';

class UserController extends GetxController {
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

  Future<bool> updateName(String name) async {
    try {
      bool result = await User.updateName(name);
      if (result == true) {
        fetchApi();
        return true;
      } else {
        // make toast
        Fluttertoast.showToast(
          msg: 'Gagal mengubah nama',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> updateEmail(String email) async {
    try {
      bool result = await User.updateEmail(email);
      if (result == true) {
        fetchApi();
        return true;
      } else {
        // make toast
        Fluttertoast.showToast(
          msg: 'Gagal mengubah Email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> updateNPM(String npm) async {
    try {
      bool result = await User.updateNPM(npm);
      if (result == true) {
        fetchApi();
        return true;
      } else {
        // make toast
        Fluttertoast.showToast(
          msg: 'Gagal mengubah NPM',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> updatePhone(String phone) async {
    try {
      bool result = await User.updatePhone(phone);
      if (result == true) {
        fetchApi();
        return true;
      } else {
        // make toast
        Fluttertoast.showToast(
          msg: 'Gagal mengubah Phone',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> updatePassword(
      String password, String passwordConfirmation) async {
    try {
      bool result = await User.updatePassword(password, passwordConfirmation);
      if (result == true) {
        fetchApi();
        return true;
      } else {
        // make toast
        Fluttertoast.showToast(
          msg: 'Gagal mengubah Password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return false;
  }
}
