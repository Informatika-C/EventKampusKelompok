import 'package:get/get.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/url.dart';
import 'dart:convert';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  final RxList<String> _listBanner = <String>[].obs;

  bool get getIsLoading =>
      isLoading.value || Get.find<UserController>().isLoading.value;

  List<String> get getListBanner => _listBanner;

  @override
  void onInit() {
    super.onInit();
    getHomePage();
  }

  Future<void> getHomePage() async {
    try {
      isLoading.value = true;
      final result = await http.get(Uri.parse('${URL.BASE_URL}home'));
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        List listBanner = data['banner'];
        listBanner.forEach((element) {
          _listBanner.add('${URL.BASE_URL}${element}');
        });
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      isError.value = true;
      errorMassage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
