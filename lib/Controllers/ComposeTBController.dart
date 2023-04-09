import 'package:get/get.dart';
import 'package:irle_thanks_box/Screens/ComposeTBScreen/ComposeTBScreen.dart';

import '../Models/DepartmentModel.dart';
import '../Models/WorkerModel.dart';
import '../Repos/APIs.dart';

class ComposeTBController extends GetxController {
  var isDepSelected = false.obs;
  var isWorkersSelected = false.obs;
  var isWorkerSelected = false.obs;

  var selectedWorkers = <WorkerData>[].obs;

  void toggleSelection(int index) {
    if (selectedWorkers
        .map((element) => element.id)
        .contains(workerModel[index].id)) {
      selectedWorkers.value = selectedWorkers
          .where((worker) => worker.id != workerModel[index].id)
          .toList();
    } else {
      selectedWorkers
          .add(WorkerData(workerModel[index].name!, workerModel[index].id!));
      isWorkerSelected.value = true;
    }
  }

  var isLoadingForGetDepartment = false.obs;
  var isLoadingForTbSending = false.obs;
  var isLoadingForWorker = false.obs;

  var bottomSheetDepTitle = "Алба хэлтэс сонгох".obs;

  RxList<DepartmentModel> departmentModel = RxList<DepartmentModel>();
  RxList<WorkerModel> workerModel = RxList<WorkerModel>();

  Future<void> getDepartment(int userId, String token) async {
    isLoadingForGetDepartment.value = true;

    departmentModel.value = await API().getDepartment(userId, token);
    isLoadingForGetDepartment.value = false;
  }

  Future<void> getWorker(int departmentId, int companyId) async {
    isLoadingForWorker.value = true;

    workerModel.value = await API().getWorker(departmentId, companyId);

    isLoadingForWorker.value = false;
  }
}
