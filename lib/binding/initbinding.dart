import 'package:get/get.dart';
import 'package:prtc/controller/app_controller.dart';
import 'package:prtc/repository/youtube_repository.dart';


class Initbinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(YoutubeRepository());
  }

}


