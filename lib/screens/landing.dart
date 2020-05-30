import 'package:flutter/material.dart';
import 'package:getout/widgets/carouselSlider.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          CarouselSliderWidget(),
          Positioned(
            bottom: 20,
            left: 50,
            child: MaterialButton(
              color: Colors.white.withOpacity(0.5),
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () => print('SIGN IN'),
              child: Text(
                'SIGN IN',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    letterSpacing: 1),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 50,
            child: MaterialButton(
              color: Colors.white.withOpacity(0.5),
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () => print('SIGN UP'),
              child: Text(
                'SIGN UP',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
