import 'package:get/get.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/url.dart';
import 'dart:convert';
import 'package:tekno_expo/utils/token.dart';

class HistoryController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  bool get getIsLoading =>
      isLoading.value || Get.find<UserController>().isLoading.value;

  RxList _listHistory = [].obs;

  List get getListHistory => _listHistory;

  @override
  void onInit() {
    super.onInit();
    getHistory();
  }

  Future<void> getHistory() async {
    try {
      // get Token
      String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }

      isLoading.value = true;
      final result = await http.get(Uri.parse('${URL.BASE_URL}user/history'),
          headers: {'Authorization': 'Bearer ${token}}'});
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        _listHistory.value = data;

        for (var i = 0; i < _listHistory.length; i++) {
          _listHistory[i]['gambar_poster'] =
              '${URL.BASE_URL}${_listHistory[i]['gambar_poster']}';
        }

        // reverse list
        _listHistory = _listHistory.reversed.toList().obs;
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
