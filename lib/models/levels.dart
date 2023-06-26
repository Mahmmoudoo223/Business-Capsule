

import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Levels {
  String id;
  String Titel;
  int levelNumber;
  String Image;

  Levels(
    this.id,
    this.Titel,
    this.levelNumber,
    this.Image,
  );

  static List<Levels> generateLevels() {
    return [
      Levels(
        "1",
        "12".tr,
        1,
        "assets/images/1.png",
      ),
      Levels(
        "2",
        "13".tr,
        2,
        "assets/images/2.png",
      ),
      Levels(
        "3",
        "14".tr,
        3,
        "assets/images/3.png",
      ),
      Levels(
        "4",
        "15".tr,
        4,
        "assets/images/4.png",
      ),
    ];
  }
}
