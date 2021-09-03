import 'package:get/get.dart';
import 'package:prtc/models/statistics.dart';
import 'package:prtc/models/youtube_video_result.dart';
import 'package:prtc/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();


  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos() async {
    String url = '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBu1nbmf-ecyl9su1s_kBPh1l-Fw27Z-YE';
    final response = await get(url);
    if (response.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
  Future<Statistics> getInfoById(String videoId) async {
    String url = '/youtube/v3/videos?part=statistics&key=AIzaSyBu1nbmf-ecyl9su1s_kBPh1l-Fw27Z-YE&id=$videoId';
    final response = await get(url);
    if (response.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String,dynamic> data = response.body['items'][0];
        return Statistics.fromJson(data['statistics']);
      }
    }
  }
  Future<Youtuber> getYoutuberId(String channelId) async {
    String url = '/youtube/v3/channels?part=statistics&part=snippet&key=AIzaSyBu1nbmf-ecyl9su1s_kBPh1l-Fw27Z-YE&id=$channelId';
    final response = await get(url);
    if (response.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body['items'].length > 0) {
        Map<String,dynamic> data = response.body['items'][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
