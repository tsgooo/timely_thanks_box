import 'package:get/get.dart';

import '../Models/ReceivedTBModel.dart';
import '../Models/SentTBModel.dart';
import '../Models/TBSendingModel.dart';
import '../Models/TemplateModel.dart';
import '../Repos/APIs.dart';

class ThanksBoxController extends GetxController {
  // final receivedTBController = Get.put(ReceivedTBController());

  var isLoadingPut = false.obs;
  var isLoadingReceived = false.obs;
  var isLoadingSentList = false.obs;
  var isLoadingTemplate = false.obs;

  var message = ''.obs;
  var success = ''.obs;

  var mySentListModel = SentTbModel().obs;
  var receivedListModel = ReceivedTbModel().obs;
  var templateModel = TemplateModel().obs;
  var tbSendingModel = TbSendingModel().obs;

  @override
  void onInit() {
    getReceived(2684, '1', 1);
    // ever(isLoadingPut, (bool value) {
    //   if (value) {
    //     Get.snackbar(message.value, success.value);
    //   }
    // });
    super.onInit();
  }

  void getSentList(int userId, String token, int type) async {
    isLoadingSentList.value = true;

    var result = await API().getSentTB(userId, token, type);

    if (result.success == '1') {
      mySentListModel(result);
    }
    isLoadingSentList.value = false;
  }

  void putThankBox(int userId, String token, int departmentId,
      String employeeId, String description, int templateId) async {
    isLoadingPut.value = true;

    tbSendingModel.value = await API().tbSending(
        userId, token, departmentId, employeeId, description, templateId);

    message.value = tbSendingModel.value.message!;
    success.value = tbSendingModel.value.success!;

    print('message: ${tbSendingModel.value.message}');

    isLoadingPut.value = true;
  }

  void getReceived(int userId, String token, int type) async {
    isLoadingReceived.value = true;

    var result = await API().getReceived(userId, token, type);
    if (result.success == '1') {
      receivedListModel(result);
    }
    isLoadingReceived.value = false;
  }

  var templateData = <TemplateData>[].obs;

  Future<void> getTemplate(int userId, String token) async {
    isLoadingTemplate.value = true;

    templateModel.value = await API().getTemplate(userId, token);

    if (templateModel.value.success == "1") {
      templateData.value = templateModel.value.data!;
    }
    isLoadingTemplate.value = false;
  }
}
