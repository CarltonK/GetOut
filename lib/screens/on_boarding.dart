import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getout/provider/indexNotifier.dart';
import 'package:getout/provider/offsetNotifier.dart';
import 'package:getout/screens/intro/intro_one.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
  }

  Widget _introHeader() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Get Out',
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w800
                  )
                ),
                Text(
                  'Skip',
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w800
                  )
                ),
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            _introHeader(),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  Provider.of<IndexNotifier>(context).index = index;
                },
                children: [
                  IntroOne(),
                  IntroOne(),
                  IntroOne()
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}