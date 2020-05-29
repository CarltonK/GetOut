import 'package:flutter/material.dart';
import 'package:getout/models/intro_model.dart';
import 'package:getout/provider/indexNotifier.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatelessWidget {
  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate,
      width: 10,
      height: 10,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.black : Colors.transparent,
          border: Border.all(color: Colors.black, width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<IndexNotifier>(context).index;

    List<Widget> _buildIndicator() {
      List<Widget> indicators = new List();

      for (int i = 0; i < intros.length; i++) {
        indicators
            .add(i == currentIndex ? _indicator(true) : _indicator(false));
      }
      return indicators;
    }

    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Row(
        children: _buildIndicator(),
      ),
    );
  }
}
