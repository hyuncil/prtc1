import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(height: 250, color: Colors.grey.withOpacity(0.5)),
          Expanded(child: _description())
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titlezone(),
          line,
          _descriptionZone(),
          _buttonZone(),
          line,
          _OwnerZone()
        ],
      ),
    );
  }

  Widget _titlezone() {
    return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '개발하는 남자 유튜브 영상 다시보기 ',
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    '조회수 1000회',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text('·'),
                  Text(
                    '2021-8-24',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget get line =>
      Container(
        height: 1,
        color: Colors.black.withOpacity(0.1),
      );

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        '안녕하세요 개발하는남자 현철 입니다',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buttonOne(String iconpath, String text) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/icons/$iconpath.svg'),
        Text(text),
        Padding(padding: EdgeInsets.only(bottom: 20))
      ],
    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne('like', '1000'),
        _buttonOne('dislike', '0'),
        _buttonOne('share', '공유'),
        _buttonOne('save', '저장'),
      ],
    );
  }

  Widget _OwnerZone() {
    return Container(child:
    Padding(
      padding: const EdgeInsets.symmetric(vertical:10,horizontal: 20),
      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children:[CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey.withOpacity(0.5),
        backgroundImage: Image.network(
            'https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s88-c-k-c0x00ffffff-no-rj')
            .image,
      ),

      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children:[
        Text('개발하는 남자', style: TextStyle(fontSize: 18),),
          Text('구독자 100000', style: TextStyle(fontSize: 14,color: Colors.black.withOpacity(0.6)),),
            ],),
      ),
        GestureDetector(child: Text('구독',style: TextStyle(color: Colors.red,fontSize: 16),),)],),
    ),);
  }
}
