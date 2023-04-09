import 'package:get/get_connect.dart';
import 'package:irle_thanks_box/Models/DepartmentModel.dart';
import 'package:irle_thanks_box/Models/TBSendingModel.dart';

import '../Models/ReceivedTBModel.dart';
import '../Models/SentTBModel.dart';
import '../Models/TemplateModel.dart';
import '../Models/WorkerModel.dart';
import 'EndPoints.dart';

class API extends GetConnect {
  Future<ReceivedTbModel> getReceived(
      int userId, String token, int type) async {
    String endpoint = EndpointConfig.getEnpoint(ENDPOINT.GET_RECEIVED_TB);

    final response = await get(
        'https://local.timely.mn/api/thanks_box.php?user_id=2684&token=1&type=1');
    if (response.statusCode == 200) {
      return receivedTbModelFromJson(response.bodyString.toString());
    } else {
      return receivedTbModelFromJson(response.bodyString.toString());
    }
  }

  Future<SentTbModel> getSentTB(int userId, String token, int type) async {
    String endpoint = EndpointConfig.getEnpoint(ENDPOINT.GET_SENT_TB);

    final response = await get(
        'https://local.timely.mn/api/thanks_box.php?user_id=2684&token=1&type=2');

    if (response.statusCode == 200) {
      return sentTbModelFromJson(response.bodyString.toString());
    } else {
      return sentTbModelFromJson(response.bodyString.toString());
    }
  }

  Future<List<DepartmentModel>> getDepartment(
    int userId,
    String token,
  ) async {
    // String endpoint = EndpointConfig.getEnpoint(ENDPOINT.GET_RECEIVED_TB);

    final response = await get(
        'https://admin.timely.mn/api/department.php?user_id=2684&token=1');

    if (response.statusCode == 200) {
      return departmentModelFromJson(response.bodyString!);
    } else {
      return departmentModelFromJson(response.bodyString.toString());
    }
  }

  Future<TbSendingModel> tbSending(int userId, String token, int departmentId,
      String employeeId, String description, int templateId) async {
    String endpoint = EndpointConfig.getEnpoint(ENDPOINT.PUT_THANKS_BOX);

    Map<String, dynamic> data = {
      'user_id': userId,
      'token': token,
      'department_id': departmentId,
      'employee_id': employeeId,
      'description': description,
      'template_id': templateId,
    };

    var formData = FormData(data);
    final response = await post(
        'https://local.timely.mn/api/thanks_box_insert.php', formData);

    if (response.statusCode == 200) {
      return tbSendingModelFromJson(response.bodyString.toString());
    } else {
      return tbSendingModelFromJson(response.bodyString.toString());
    }
  }

  Future<List<WorkerModel>> getWorker(int departmentId, int companyId) async {
    // String endpoint = EndpointConfig.getEnpoint(ENDPOINT.PUT_THANKS_BOX);

    final response = await get(
        'https://admin.timely.mn/api/workers.php?company_id=1&department_id=0');

    if (response.statusCode == 200) {
      return workerModelFromJson(response.bodyString.toString());
    } else {
      return workerModelFromJson(response.bodyString.toString());
    }
  }

  Future<TemplateModel> getTemplate(int userId, String token) async {
    String endpoint = EndpointConfig.getEnpoint(ENDPOINT.GET_TEMPLATE);

    final response = await get(
        'https://local.timely.mn/api/thanks_box_template.php?user_id=2684&token=1');

    if (response.statusCode == 200) {
      return templateModelFromJson(response.bodyString!);
    } else {
      return templateModelFromJson(response.bodyString!);
    }
  }
}
