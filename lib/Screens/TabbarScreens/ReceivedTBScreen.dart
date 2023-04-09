import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irle_thanks_box/Controllers/ReceivedTBController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/ReceivedTBCard.dart';
import '../../Components/ReceivedTBShimmer.dart';
import '../../Components/ThankBoxComponents/TBColors.dart';
import '../../Controllers/ThanksBoxController.dart';

class ReceivedTBScreen extends StatefulWidget {
  const ReceivedTBScreen({super.key});

  @override
  State<ReceivedTBScreen> createState() => ReceivedTBScreenState();
}

class ReceivedTBScreenState extends State<ReceivedTBScreen>
    with AutomaticKeepAliveClientMixin {
  final thanksBoxController = Get.put(ThanksBoxController());
  final controller = Get.put(ReceivedTBController());
  late SharedPreferences prefs;

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        thanksBoxController.getReceived(
            2684, 'b4756d2719cc7f80c0b937c72563742d', 1);
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => thanksBoxController.isLoadingReceived.value
                    ? const ReceivedTBShimmer()
                    : thanksBoxController.receivedListModel.value.data == null
                        ? const Center(child: Text('Hooson baina'))
                        : controller.isLoadingValues.value
                            ? const ReceivedTBShimmer()
                            : ListView.builder(
                                itemCount: thanksBoxController
                                    .receivedListModel.value.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      await prefs.setBool(
                                          'isTapped$index', true);
                                    },
                                    child: ReceivedTBCard(
                                      isTapped:
                                          prefs.containsKey('isTapped$index')
                                              ? prefs.getBool('isTapped$index')!
                                              : false,
                                      color1: myColors[Random().nextInt(16)],
                                      color2: myColors[Random().nextInt(16)],
                                      receivedListModel: thanksBoxController
                                          .receivedListModel.value.data![index],
                                    ),
                                  );
                                },
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
