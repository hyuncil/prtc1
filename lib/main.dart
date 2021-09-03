import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initbinding.dart';
import 'component/youtube_detail.dart';
import 'pages/app.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white
      ),
      initialBinding: Initbinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>App()),
        GetPage(name: '/detail/:videoId', page: ()=>YoutubeDetail())

      ],
    );
  }
}
