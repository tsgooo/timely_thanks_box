import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Controllers/ThanksBoxController.dart';

final thanksBoxController = Get.put(ThanksBoxController());

List<List<Image>> tbImages = [
  [
    Image.network(thanksBoxController.templateData[12].picture!),
    Image.network(thanksBoxController.templateData[13].picture!),
    Image.network(thanksBoxController.templateData[14].picture!),
    Image.network(thanksBoxController.templateData[15].picture!),
    Image.network(thanksBoxController.templateData[16].picture!),
    Image.network(thanksBoxController.templateData[17].picture!),
  ],
  [
    Image.network(thanksBoxController.templateData[0].picture!),
    Image.network(thanksBoxController.templateData[1].picture!),
    Image.network(thanksBoxController.templateData[2].picture!),
    Image.network(thanksBoxController.templateData[3].picture!),
    Image.network(thanksBoxController.templateData[4].picture!),
    Image.network(thanksBoxController.templateData[5].picture!),
  ],
  [
    Image.network(thanksBoxController.templateData[6].picture!),
    Image.network(thanksBoxController.templateData[7].picture!),
    Image.network(thanksBoxController.templateData[8].picture!),
    Image.network(thanksBoxController.templateData[9].picture!),
    Image.network(thanksBoxController.templateData[10].picture!),
    Image.network(thanksBoxController.templateData[11].picture!),
  ],
  [
    Image.network(thanksBoxController.templateData[30].picture!),
    Image.network(thanksBoxController.templateData[31].picture!),
    Image.network(thanksBoxController.templateData[32].picture!),
    Image.network(thanksBoxController.templateData[33].picture!),
    Image.network(thanksBoxController.templateData[34].picture!),
    Image.network(thanksBoxController.templateData[35].picture!),
  ],
  [
    Image.network(thanksBoxController.templateData[18].picture!),
    Image.network(thanksBoxController.templateData[19].picture!),
    Image.network(thanksBoxController.templateData[20].picture!),
    Image.network(thanksBoxController.templateData[21].picture!),
    Image.network(thanksBoxController.templateData[22].picture!),
    Image.network(thanksBoxController.templateData[23].picture!),
  ],
  [
    Image.network(thanksBoxController.templateData[24].picture!),
    Image.network(thanksBoxController.templateData[25].picture!),
    Image.network(thanksBoxController.templateData[26].picture!),
    Image.network(thanksBoxController.templateData[27].picture!),
    Image.network(thanksBoxController.templateData[28].picture!),
    Image.network(thanksBoxController.templateData[29].picture!),
  ],
];
