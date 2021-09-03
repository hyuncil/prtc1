import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _actions(),
      ],
    ));
  }

  Widget _logo() {
    return Container(
      child: Image.asset(
        'assets/images/logo.png',
        width: 130,
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
            width: 23,
            height: 23,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              child: SvgPicture.asset('assets/svg/icons/search.svg'),
              width: 30,
              height: 30,
            ),
          ),
        ),
        CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),
        backgroundImage: Image.network('https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s88-c-k-c0x00ffffff-no-rj').image,)
      ],
    );
  }
}
