import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irle_thanks_box/Components/SentTBShimmer.dart';

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
                    : const SentTBShimmer(),
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
