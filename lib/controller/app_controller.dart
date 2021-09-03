import 'package:get/get.dart';
import 'package:prtc/component/youtube_bottom_sheet.dart';

enum RouteName{Home,Explore,Add,Subs,Library}

class AppController extends GetxController{
  static AppController get to => Get.find();
   RxInt currentIndex = 0.obs;
   void changePageIndex(int index){
    if(RouteName.values[index]==RouteName.Add){
      return _bottomSheet();
    }else{
      currentIndex(index);
   }
}

  void _bottomSheet() {
   Get.bottomSheet(YoutubeBottomSheet());
   }
}