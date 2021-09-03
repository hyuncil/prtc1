import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:prtc/controller/app_controller.dart';
import 'package:prtc/pages/subs.dart';

import 'explore.dart';
import 'home.dart';
import 'library.dart';

class App extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Youtube'),
        ),
        body: Obx((){
          switch(RouteName.values[controller.currentIndex.value]){

            case RouteName.Home:
            return Home();
            break;
          case RouteName.Explore:
            return Explore();
            break;
          case RouteName.Subs:
           return Subs();
            break;
          case RouteName.Library:
            return Library();
            break;
        }return Container();
        }),

        bottomNavigationBar:Obx(()=>BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
            activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
              label: '홈'
            ),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/compass_off.svg',width: 25,),
                activeIcon: SvgPicture.asset('assets/svg/icons/compass_on.svg',width: 25,),
                label: '탐색'
            ), BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/plus.svg',width: 40,),
                label: '추가'
            ), BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
                label: '구독'
            ), BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
                activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
                label: '보관'
            ),
          ],
        ),
        ),
    );
  }
}
