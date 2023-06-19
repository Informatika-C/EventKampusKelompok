import 'package:get/get.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/url.dart';
import 'dart:convert';
import 'package:tekno_expo/utils/token.dart';

class PesertaController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  RxList _listPeserta = [].obs;

  bool get getIsLoading =>
      isLoading.value || Get.find<UserController>().isLoading.value;

  List get getListPeserta => _listPeserta;

  @override
  void onInit() {
    super.onInit();
    getPeserta();
  }

  Future<void> getPeserta() async {
    try {
      // get Token
      String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }

      isLoading.value = true;
      final result = await http.get(Uri.parse('${URL.BASE_URL}peserta'),
          headers: {'Authorization': 'Bearer ${token}}'});
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        _listPeserta.value = data;
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
