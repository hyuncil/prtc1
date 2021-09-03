import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prtc/component/video_wiget.dart';
import 'package:prtc/controller/home_controller.dart';

import '../component/custom_appbar.dart';

class Home extends StatelessWidget {
 final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/detail/321654');
                },
                child: VideoWidget(video: controller.youtubeResult.value.items[index],),
              );
            }, childCount:controller.youtubeResult.value.items.length))
          ],
        ),
      )),
    );
  }
}
