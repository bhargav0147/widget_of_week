import 'package:get/get.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';

class SpeedTestController extends GetxController {
  var progressBarValue = 0.0.obs;
  var downloadValue = 0.0.obs;
  var uploadValue = 0.0.obs;
  var displayValue = 0.0.obs;
  var isTestingStarted = false.obs;

   testingInternetSpeed() {
    final speedTest = FlutterInternetSpeedTest();
    speedTest.startTesting(
      onStarted: () {
        isTestingStarted.value = true;
       
      },
      onCompleted: (TestResult download, TestResult upload) {
        downloadValue.value = download.transferRate;
        progressBarValue.value = 100.0;
        displayValue = downloadValue;

        uploadValue.value = upload.transferRate;
        progressBarValue.value = 100.0;
        displayValue = uploadValue;

        isTestingStarted.value = false;
      },
      onProgress: (double percent, TestResult data) {
        if (data.type == TestType.download) {
          downloadValue.value = data.transferRate;
          displayValue = downloadValue;
          progressBarValue.value = percent;
        } else {
          uploadValue.value = data.transferRate;
          displayValue = uploadValue;
          progressBarValue.value = percent;
        }
      },
      onError: (String errorMessage, String speedTestError) {
        print('errorMessage : $errorMessage');
        print('speedTestError : $speedTestError');
      },
      onDefaultServerSelectionInProgress: () {},
      onDefaultServerSelectionDone: (Client? client) {},
      onDownloadComplete: (TestResult data) {
        downloadValue.value = data.transferRate;
        displayValue = downloadValue;
      },
      onUploadComplete: (TestResult data) {
        uploadValue.value = data.transferRate;
        displayValue = uploadValue;
      },
      onCancel: () {},
    );
  }
}
