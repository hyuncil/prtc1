import 'package:prtc/models/video.dart';

class YoutubeVideoResult {
 String nextPageToken;
 int totalResults;
 int resultPerPage;
 List<Video> items;

 YoutubeVideoResult ({this.resultPerPage,this.totalResults,this.nextPageToken,this.items});

 factory YoutubeVideoResult.fromJson(Map<String,dynamic>json)=>
     YoutubeVideoResult(
       nextPageToken: json['nextPageToken']??'',
       totalResults: json['pageInfo']['totalResults'],
       resultPerPage: json['pageInfo']['resultPerPage'],
       items: List<Video>.from(json['items'].map((data)=>Video.fromJson(data))));
 // 리스트 타입은 위와 같이 맵으로 돌려준다
}

