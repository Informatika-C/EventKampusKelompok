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
  final RxList _listEvent = [].obs;
  final RxList _listEventAcademic = [].obs;
  final RxList _listEventNonAcademic = [].obs;

  bool get getIsLoading =>
      isLoading.value || Get.find<UserController>().isLoading.value;

  List<String> get getListBanner => _listBanner;
  List get getListEvent => _listEvent;
  List get getListEvenAcademic => _listEventAcademic;
  List get getListEvenNonAcademic => _listEventNonAcademic;

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
}
