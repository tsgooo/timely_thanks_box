import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

import '../../Components/SentTBCard.dart';
import '../../Controllers/ThanksBoxController.dart';

class SentTBScreen extends StatefulWidget {
  const SentTBScreen({super.key});

  @override
  State<SentTBScreen> createState() => _SentTBScreenState();
}

class _SentTBScreenState extends State<SentTBScreen>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _controller;
  final _thankBoxController = Get.put(ThanksBoxController());

  @override
  void initState() {
    super.initState();
    _thankBoxController.getSentList(2684, '1', 2);
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        _thankBoxController.getSentList(2684, '1', 2);
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => _thankBoxController.isLoadingSentList.value == false
                    ? _thankBoxController.mySentListModel.value.mySentList !=
                            null
                        ? ListView.builder(
                            controller: _controller,
                            shrinkWrap: true,
                            itemCount: _thankBoxController
                                        .mySentListModel.value.mySentList !=
                                    null
                                ? _thankBoxController
                                    .mySentListModel.value.mySentList!.length
                                : 0,
                            itemBuilder: (context, index) {
                              var item = _thankBoxController
                                  .mySentListModel.value.mySentList![index];
                              return SentTBCard(
                                model: item,
                              );
                            },
                          )
                        : const Center(
                            child: Expanded(
                              child: Text("hooson"),
                            ),
                          )
                    : ShimmerEffect(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                                height: 12,
                                                width: 150,
                                                color: Colors.grey[100]),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                                height: 15,
                                                width: 100,
                                                color: Colors.grey[100]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(1000),
                                              child: Container(
                                                  height: 75,
                                                  width: 75,
                                                  color: Colors.grey[100]),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                    height: 15,
                                                    width: 100,
                                                    color: Colors.grey[100]),
                                              ),
                                              const SizedBox(height: 20),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                    height: 15,
                                                    width: 180,
                                                    color: Colors.grey[100]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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
