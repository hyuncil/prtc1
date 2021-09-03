import 'package:get/get.dart';
import 'package:prtc/models/statistics.dart';
import 'package:prtc/models/video.dart';
import 'package:prtc/models/youtuber.dart';
import 'package:prtc/repository/youtube_repository.dart';

class VideoController extends GetxController{
  Video video;
  VideoController({this.video});
  static VideoController get to => Get.find();
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async{
 Statistics loadstatistics = await  YoutubeRepository.to.getInfoById(video.id.videoId);
  statistics(loadstatistics);
 Youtuber loadYoutuber = await  YoutubeRepository.to.getYoutuberId(video.snippet.channelId);(loadstatistics);
  youtuber(loadYoutuber);
    super.onInit();
  }
  String get CountView{
    return ('조회수${statistics.value.viewCount?? '_'}회');
  }
 String get YoutuberThumbnailUrl{
    if(youtuber.value.snippet == null) return 'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png';
 return youtuber.value.snippet.thumbnails.medium.url;
  }
}