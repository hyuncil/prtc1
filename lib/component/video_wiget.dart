import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prtc/controller/video_controller.dart';
import 'package:prtc/models/video.dart';
import 'package:intl/intl.dart';
import 'package:prtc/models/youtube_video_result.dart';
import 'package:prtc/models/youtuber.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({Key key, this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController videoController;
@override
  void initState() {
  videoController = Get.put(VideoController(video: widget.video),tag: widget.video.id.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 20),
        child: Row(
          children: [
            Obx(()=>CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(videoController.YoutuberThumbnailUrl
                     )

                  .image,
            ),),
            SizedBox(width: 15),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          widget.video.snippet.title,
                          maxLines: 2),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 18,
                        ),
                        onPressed: () {})
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '개발하는 남자 유튜브 다시보기',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text('·'),
                    Obx(()=>Text(videoController.CountView,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),),
                    Text('·'),
                    Text(DateFormat('yyyy-MM-dd').format(widget.video.snippet.publishedAt,),

                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _thumbnail() {
    return Container(height: 250, color: Colors.grey.withOpacity(0.5),child:
      Image.network(widget.video.snippet.thumbnails.medium.url,fit:BoxFit.fitWidth),);
  }
}
