import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prtc/pages/app.dart';

class YoutubeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10,),
            _Itembutton(
              icon:'upload',
              iconSize:17,
              label:'동영상 업로드',
              onTap:(){
                print('동영상 업로드 기능');
              },
            ),
            SizedBox(height: 10,),
            _Itembutton(
              icon:'broadcast',
              iconSize:25,
              label:'실시간 스트리밍 시작',
              onTap:(){
                print('실시간 스트리밍 시작');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _Itembutton({String icon,double iconSize,String label,Function onTap } ) {
    return InkWell(
            onTap: onTap,
            child: Row(children: [
              Container(width: 50,height: 50,
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.withOpacity(0.3)),
                  child: SvgPicture.asset('assets/svg/icons/$icon.svg'),
                ),
              ),
              SizedBox(width: 15,),
              Text(label)
            ]),
          );
  }

  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            '만들기',
            style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: Get.back,
        )
      ],
    );
  }
}
