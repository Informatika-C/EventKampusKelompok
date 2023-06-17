import 'package:get/get.dart';
import 'package:tekno_expo/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tekno_expo/utils/url.dart';
import 'dart:convert';
import 'package:tekno_expo/utils/token.dart';

class EventController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorMassage = ''.obs;

  RxBool bottomSheetLoading = true.obs;
  RxBool bottomSheetError = false.obs;
  RxString bottomSheetErrorMassage = ''.obs;

  RxBool daftarLoading = true.obs;
  RxBool daftarError = false.obs;
  RxString daftarErrorMassage = ''.obs;

  RxList _listKategori = [].obs;

  final RxList<String> _listBanner = <String>[].obs;
  final RxList _listEvent = [].obs;
  final RxList _listEventAcademic = [].obs;
  final RxList _listEventNonAcademic = [].obs;

  bool get getIsLoading =>
      isLoading.value || Get.find<UserController>().isLoading.value;

  List<String> get getListBanner => _listBanner;
  List get getListEvent => _listEvent;
  List get getListEvenAcademic => _listEventAcademic;
  List get getListEvenNonAcademic => _listEventNonAcademic;

  bool get getIsLoadingBottomSheet => bottomSheetLoading.value;
  List get getListKategori => _listKategori;

  @override
  void onInit() {
    super.onInit();
    getHomePage();
  }

  Future<void> getHomePage() async {
    try {
      // get Token
      String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }

      isLoading.value = true;
      final result = await http.get(Uri.parse('${URL.BASE_URL}event'),
          headers: {'Authorization': 'Bearer ${token}}'});
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);

        // Add Event
        List event = data['event'];
        event.forEach((element) {
          element['gambar_poster'] =
              '${URL.BASE_URL}${element['gambar_poster']}';
        });
        event.forEach((element) {
          element['gambar_banner'] =
              '${URL.BASE_URL}${element['gambar_banner']}';
        });
        event.forEach((element) {
          _listEvent.add(element);
        });

        // Add Event Academic
        List eventAcademic = data['event_academic'];
        eventAcademic.forEach((element) {
          element['gambar_poster'] =
              '${URL.BASE_URL}${element['gambar_poster']}';
        });
        eventAcademic.forEach((element) {
          element['gambar_banner'] =
              '${URL.BASE_URL}${element['gambar_banner']}';
        });
        eventAcademic.forEach((element) {
          _listEventAcademic.add(element);
        });

        // Add Event Non Academic
        List eventNonAcademic = data['event_non_academic'];
        eventNonAcademic.forEach((element) {
          element['gambar_poster'] =
              '${URL.BASE_URL}${element['gambar_poster']}';
        });
        eventNonAcademic.forEach((element) {
          element['gambar_banner'] =
              '${URL.BASE_URL}${element['gambar_banner']}';
        });
        eventNonAcademic.forEach((element) {
          _listEventNonAcademic.add(element);
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

  Future<void> getKategori(int id_event) async {
    try {
      // get Token
      String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }

      bottomSheetLoading.value = true;
      final result = await http.get(
          Uri.parse('${URL.BASE_URL}kategori/$id_event'),
          headers: {'Authorization': 'Bearer ${token}}'});
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        _listKategori.value = data;
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      bottomSheetError.value = true;
      bottomSheetErrorMassage.value = e.toString();
    } finally {
      bottomSheetLoading.value = false;
    }
  }

  void daftarKategori(int idKategori) async {
    try {
      // get Token
      String? token = await Token.getToken();
      if (token == null) {
        token = '';
      }

      daftarLoading.value = true;
      final result = await http.get(
          Uri.parse('${URL.BASE_URL}kategori/daftarkategori/$idKategori'),
          headers: {'Authorization': 'Bearer ${token}}'});
      if (result.statusCode == 200) {
        final data = jsonDecode(result.body);
        // make snackbar
        Get.snackbar('Berhasil', data['message']);
      } else {
        throw Exception('Gagal mengambil data');
      }
    } catch (e) {
      daftarError.value = true;
      daftarErrorMassage.value = e.toString();
    } finally {
      daftarLoading.value = false;
    }
  }
}
