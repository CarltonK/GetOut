import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getout/provider/indexNotifier.dart';
import 'package:getout/provider/offsetNotifier.dart';
import 'package:getout/screens/intro/intro_one.dart';
import 'package:getout/screens/intro/intro_three.dart';
import 'package:getout/screens/intro/intro_two.dart';
import 'package:getout/screens/landing.dart';
import 'package:getout/widgets/pageIndicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController;
  int _globalIndex;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _pageController = PageController();
  }

  Widget _introHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LandingScreen()));
            },
            padding: EdgeInsets.all(8),
            child: Text('Skip',
                style: GoogleFonts.quicksand(
                    fontSize: 22, fontWeight: FontWeight.w800)),
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
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                Provider.of<IndexNotifier>(context, listen: false).index =
                    index;
                setState(() {
                  _globalIndex = index;
                });
              },
              children: [IntroOne(), IntroTwo(), IntroThree()],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageIndicator(),
                ),
                _globalIndex == 2
                    ? Padding(
                        padding: EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LandingScreen()));
                          },
                        ))
                    : Container()
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
