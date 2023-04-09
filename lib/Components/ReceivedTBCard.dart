import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:super_banners/super_banners.dart';

import '../Controllers/ReceivedTBController.dart';
import '../Models/ReceivedTBModel.dart';

class ReceivedTBCard extends StatefulWidget {
  final ReceivedModel receivedListModel;
  final Color color1;
  final Color color2;
  final bool isTapped;
  const ReceivedTBCard({
    super.key,
    required this.receivedListModel,
    required this.color1,
    required this.color2,
    required this.isTapped,
  });

  @override
  State<ReceivedTBCard> createState() => _ReceivedTBCardState();
}

class _ReceivedTBCardState extends State<ReceivedTBCard> {
  @override
  void initState() {
    super.initState();
  }

  Uint8List? bytes;
  final _screenshotController = ScreenshotController();
  final controller = Get.put(ReceivedTBController());

  void toggleVisibility() {
    setState(() {
      controller.isVisible.value = !controller.isVisible.value;
    });
  }

  Widget buildDialog() => Screenshot(
        controller: _screenshotController,
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          // height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [widget.color1, widget.color2],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          'assets/timely_logo1.png',
                          height: MediaQuery.of(context).size.height * 0.028868,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Obx(
                          () => !controller.isVisible.value
                              ? const Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Image.network(widget.receivedListModel.template!),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      '"${widget.receivedListModel.description!}"',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${widget.receivedListModel.from}-c',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () async {
                          toggleVisibility();
                          if (controller.isVisible.value) {
                            final Uint8List? imageBytes =
                                await _screenshotController.capture();
                            await saveAndShare(imageBytes!);
                            toggleVisibility();
                          }
                        },
                        child: Obx(
                          () => !controller.isVisible.value
                              ? const Text('Хуваалцах')
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytes(bytes);

    await Share.shareFiles([image.path]);
  }

  Future<dynamic> showCard() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: buildDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15, left: 10.0, right: 10, bottom: 15),
      child: InkWell(
        onTap: () async {
          showCard();
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isTapped ? Colors.transparent : Colors.grey),
                gradient: widget.isTapped
                    ? LinearGradient(
                        colors: [
                          widget.color1,
                          widget.color2,
                        ],
                      )
                    : const LinearGradient(
                        colors: [Colors.white, Colors.white],
                      ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width / 3.2,
                        width: MediaQuery.of(context).size.width / 3.2,
                        child:
                            Image.network(widget.receivedListModel.template!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              '"${widget.receivedListModel.description}"',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              textAlign: TextAlign.justify,
                              // textAlign: ,
                              style: TextStyle(
                                color: widget.isTapped
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${widget.receivedListModel.from}-c',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: widget.isTapped
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // const Spacer(),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 9),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    widget.receivedListModel.date
                                        .toString()
                                        .substring(0, 16),
                                    style: TextStyle(
                                      color: widget.isTapped
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 13.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !widget.isTapped,
              child: const PositionedCornerBanner(
                bannerPosition: CornerBannerPosition.topRight,
                bannerColor: Colors.red,
                shadowColor: Colors.black,
                elevation: 5,
                child: Text(
                  'New',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
