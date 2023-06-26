
import 'package:get/get.dart';


class MaterialViewModel extends GetxController {

  int selectedIndex=0;
  RxInt  activeToggledIndex=0.obs;


  void onInit() {

    super.onInit();

  }

  @override
  void onReady() {

    super.onReady();

  }

  @override
  void onClose() {

    super.onClose();

  }


  void changeIndex(int index){

    selectedIndex= index;
    update();
  }

  void changeToogleIndex (int index){

    activeToggledIndex.value =index;
  //  update();
  }

}
