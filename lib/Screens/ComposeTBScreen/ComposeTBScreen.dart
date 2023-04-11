import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irle_thanks_box/Components/ThankBoxComponents/TBColors.dart';
import 'package:irle_thanks_box/Components/ThankBoxComponents/TBTemplates.dart';
import 'package:irle_thanks_box/Controllers/ComposeTBController.dart';
import 'package:irle_thanks_box/Controllers/ThanksBoxController.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WorkerData {
  String name;
  String id;

  WorkerData(this.name, this.id);
}

class ComposeTBScreen extends StatefulWidget {
  const ComposeTBScreen({super.key});

  @override
  State<ComposeTBScreen> createState() => _ComposeTBScreenState();
}

class _ComposeTBScreenState extends State<ComposeTBScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    thanksBoxController.getTemplate(2684, "1");
  }

  final thanksBoxController = Get.put(ThanksBoxController());
  final composeController = Get.put(ComposeTBController());

  final pageController = PageController(initialPage: 0);
  final tfController = TextEditingController();
  String bottomSheetWorkerTitle = "Ажилтан сонгох";

  bool isTempSelected = false;
  int departmentIndex = 0;

  int selectedTempIndex = 1;

  double chipHeight = 0;

  Widget _buildSelectedWorkers() {
    return IntrinsicHeight(
      child: Obx(
        () => Wrap(
          spacing: 8.0,
          children: composeController.selectedWorkers
              .map(
                (items) => Chip(
                  label: Text(items.name),
                  onDeleted: () {
                    setState(() {
                      composeController.selectedWorkers.remove(items);
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  int defineTempIndex() {
    switch (selectedTempIndex) {
      case 1:
        return 13;
      case 2:
        return 14;
      case 3:
        return 15;
      case 4:
        return 16;
      case 5:
        return 17;
      case 6:
        return 18;

      case 7:
        return 1;
      case 8:
        return 2;
      case 9:
        return 3;
      case 10:
        return 4;
      case 11:
        return 5;
      case 12:
        return 6;

      case 13:
        return 7;
      case 14:
        return 8;
      case 15:
        return 9;
      case 16:
        return 10;
      case 17:
        return 11;
      case 18:
        return 12;

      case 19:
        return 31;
      case 20:
        return 32;
      case 21:
        return 33;
      case 22:
        return 34;
      case 23:
        return 35;
      case 24:
        return 36;

      case 25:
        return 19;
      case 26:
        return 20;
      case 27:
        return 21;
      case 28:
        return 22;
      case 29:
        return 23;
      case 30:
        return 24;

      case 31:
        return 25;
      case 32:
        return 26;
      case 33:
        return 27;
      case 34:
        return 28;
      case 35:
        return 29;
      case 36:
        return 30;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text('Талархалын хайрцаг'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return thanksBoxController.getTemplate(2684, "1");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/new-idea.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      // right: 10,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          const Text(
                            'Сэтгэлийн бэлэг илгээгээрэй',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            'Та өөрийн хамтран ажиллагч багийн найздаа талархсан сэтгэгдлээ илэрхийлэх бол энэхүү хайрцагийг ашиглаад илгээгээрэй',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Хэнд зориулсан',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  composeController.getDepartment(2684, '1');
                  departmentModalBottomSheet(context);
                  // bottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Obx(
                          () => composeController.isDepSelected.value
                              ? Text(
                                  composeController.bottomSheetDepTitle.value,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    // fontSize: 15,
                                  ),
                                )
                              : Text(
                                  composeController.bottomSheetDepTitle.value,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    // fontSize: 15,
                                  ),
                                ),
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.keyboard_arrow_down_sharp),
                          SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildSelectedWorkers(),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (composeController.isDepSelected.value == false) {
                        Get.snackbar(
                            'Oops, failed!', 'Please choose department');
                      }
                      composeController.getWorker(
                          int.parse(composeController
                              .departmentModel[departmentIndex].id!),
                          1);
                      workerModalBottomSheet(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),

                      //
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Талархал',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          controller: tfController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Талархлаа бичнэ үү',
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Загвар',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                // fit: FlexFit.tight,
                // height: 300,
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index1) {
                    return Obx(
                      () => thanksBoxController.isLoadingTemplate.value
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index2) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index2) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      index1 != 0
                                          ? selectedTempIndex =
                                              index1 * 6 + index2
                                          : selectedTempIndex = index2 + 1;
                                      isTempSelected = true;
                                    });
                                    defineTempIndex();
                                  },
                                  child: buildBlocks(index1, index2),
                                );
                              },
                            ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 6,
                      effect: const WormEffect(
                        spacing: 10.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.indigo,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: InkWell(
                  onTap: () {
                    if (tfController.text.isNotEmpty &&
                        defineTempIndex() >= 1 &&
                        composeController.selectedWorkers
                            .map((workers) => workers.id)
                            .toList()
                            .isNotEmpty) {
                      thanksBoxController.putThankBox(
                        2684,
                        "1",
                        int.parse(composeController
                            .departmentModel[departmentIndex].id!),
                        composeController.selectedWorkers
                            .map((workers) => workers.id)
                            .toList()
                            .join(','),
                        tfController.text,
                        defineTempIndex(),
                      );
                      composeController.selectedWorkers.clear();
                      tfController.clear();
                      Get.snackbar("Success", 'Your message has added');
                    } else {
                      Get.snackbar('Not valid', 'Please fill all the fields');
                    }
                    if (composeController.selectedWorkers
                        .map((workers) => int.parse(workers.id))
                        .contains(2684)) {
                      thanksBoxController.getSentList(2684, '1', 2);
                      thanksBoxController.getReceived(2684, '1', 1);
                    } else {
                      thanksBoxController.getSentList(2684, '1', 2);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () =>
                                  composeController.isLoadingForTbSending.value
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : const Text(
                                          'Илгээх',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                              // Get.snackbar(title, message)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlocks(int index1, int index2) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: !isTempSelected
                ? Colors.white
                : index1 != 0
                    ? selectedTempIndex == index1 * 6 + index2
                        ? Colors.purple
                        : Colors.white
                    : selectedTempIndex == index2 + 1
                        ? Colors.purple
                        : Colors.white,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  tbColors[index2][0],
                  tbColors[index2][1],
                ],
              ),
            ),
            height: 80,
            width: 80,
            child: tbImages[index1][index2],
          ),
        ),
      ),
    );
  }

  void departmentModalBottomSheet(context) {
    showModalBottomSheet(
      // shape: Roun,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 1,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Obx(
                    () => composeController.isLoadingForGetDepartment.value
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox.square(),
                                  const Text('Алба хэлтэс сонгох'),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),
                              const Divider(thickness: 1, color: Colors.black),
                              Expanded(
                                child: ListView.builder(
                                  itemCount:
                                      composeController.departmentModel.length,
                                  itemBuilder: (context, index) {
                                    // nogoo
                                    return ListTile(
                                      onTap: () {
                                        composeController.isDepSelected.value =
                                            true;

                                        departmentIndex = index;
                                        composeController
                                                .bottomSheetDepTitle.value =
                                            composeController
                                                .departmentModel[index].title!;
                                        setState(() {});
                                        composeController.getWorker(
                                            int.parse(composeController
                                                .departmentModel[
                                                    departmentIndex]
                                                .id!),
                                            1);
                                        Navigator.pop(context);
                                      },
                                      leading: Text(
                                        composeController
                                            .departmentModel[index].title!,
                                        style: TextStyle(
                                          color: index == departmentIndex
                                              ? Colors.blue
                                              : Colors.grey[900],
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.check,
                                        color: index == departmentIndex
                                            ? Colors.blue
                                            : Colors.grey[900],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void workerModalBottomSheet(context) {
    showModalBottomSheet(
      // shape: const RoundedRectangleBorder(),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: 1,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.square(),
                          const Text('Ажилтан сонгох'),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1, color: Colors.black),
                      Obx(
                        () => composeController.isLoadingForGetDepartment.value
                            ? const Center(child: CircularProgressIndicator())
                            : composeController.isLoadingForWorker.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : composeController.workerModel.isEmpty
                                    ? const Center(child: Text('hooson baina'))
                                    : Expanded(
                                        child: ListView.builder(
                                          itemCount: composeController
                                              .workerModel.length,
                                          itemBuilder: (context, index) {
                                            bool isSelected = composeController
                                                .selectedWorkers
                                                .map((items) => items.id)
                                                .toList()
                                                .contains(composeController
                                                    .workerModel[index].id);
                                            // end baina oo
                                            return ListTile(
                                              selected: isSelected,
                                              onTap: () {
                                                setState(() {
                                                  isSelected = composeController
                                                      .selectedWorkers
                                                      .map((items) => items.id)
                                                      .toList()
                                                      .contains(
                                                          composeController
                                                              .workerModel[
                                                                  index]
                                                              .id);
                                                });
                                                composeController
                                                    .toggleSelection(index);
                                              },
                                              leading: Text(
                                                composeController
                                                    .workerModel[index].name!,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: isSelected
                                                      ? Colors.blue
                                                      : Colors.grey,
                                                ),
                                              ),
                                              trailing: Icon(
                                                Icons.check,
                                                color: isSelected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
