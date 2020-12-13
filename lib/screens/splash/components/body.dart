import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:on_boarding_screen/components/default_Button.dart';
import '../../../size_config.dart';
import 'package:on_boarding_screen/screens/splash/components/splash_content.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to the Running Arena, Let's run!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We have lots of training & tracking for you.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We have people connect with buddy\naround the India",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity, // for making it to the Center used sized box
        child: Column(children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]["image"],
                      text: splashData[index]["text"],
                    )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(flex: 3),
                  DefaultButton(
                    text: "Continue",
                    press: () {},
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
