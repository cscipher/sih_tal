import 'dart:async';
import 'package:get/get.dart';
import 'package:sih_tal/model/respModel.dart';
import 'package:sih_tal/service/api_service.dart';
import 'package:sih_tal/utils/logger.dart';

class DataTrackController extends GetxController {
  var fieldData = <ThingSpeakFields>[].obs;
  late ApiService api;
  RxBool isLoading = false.obs;
  RxBool disposed = false.obs;

  firstTimeLoad() async {
    isLoading.value = true;
    ThingSpeakFields k = ThingSpeakFields(
        humidity: -1, temperature: -1, xcoord: -1, ycoord: -1, gasComp: -1);
    k.humidity = await api.httpGetFieldVal(Field.humidity);
    k.temperature = await api.httpGetFieldVal(Field.temperature);
    k.xcoord = await api.httpGetFieldVal(Field.xcoord);
    k.ycoord = await api.httpGetFieldVal(Field.ycoord);
    k.gasComp = await api.httpGetFieldVal(Field.gasComp);
    fieldData.value = [k];
    isLoading.value = false;
  }

  @override
  void onInit() async {
    logInfo('DataTrackController initialized');
    api = Get.put(ApiService());
    firstTimeLoad();
    Future.delayed(const Duration(seconds: 10), () => getDataFromPoll());
    super.onInit();
  }

  fetchAllRemoteFields() async {
    isLoading.value = true;
    var k = await api.httpGetFields();
    fieldData.value = k;
    isLoading.value = false;
  }

  getDataFromPoll() async {
    Timer.periodic(const Duration(seconds: 15), (timer) async {
      if (disposed.value) {
        timer.cancel();
        return;
      }
      var k = await api.httpGetFields();
      fieldData.value = k;
    });
  }
}
