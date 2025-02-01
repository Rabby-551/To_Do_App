import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoProWidget extends StatelessWidget {
  const GoProWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xff9Eb031)))),
          Positioned(
              top: 2,
              bottom: 2,
              left: 2,
              right: 2,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                        width: 2,
                        color: const Color(0xffFFFFFF).withOpacity(0.6),
                      )),
                      color: const Color(0xffCDE53D)))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/trophy.svg',
                  height: 45,
                  width: 53.1,
                ),
                const SizedBox(width: 16),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Go Pro (No Ads)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1,
                        shadows: [
                          Shadow(
                              color: Color(0xffFFFFFF), offset: Offset(0, 1)),
                        ],
                      ),
                    ),
                    Text(
                      'No fuss, no ads, for only \$1 a\nmonth',
                      style: TextStyle(
                        fontSize: 12,
                        shadows: [
                          Shadow(
                            color: Color(0xffFFFFFF),
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 24,
            top: 0,
            child: Container(
              alignment: Alignment.center,
              height: 71,
              width: 66.11,
              decoration: BoxDecoration(
                color: const Color(0xff071D55),
                borderRadius: BorderRadius.circular(0),
              ),
              child: const Text(
                '\$1',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF2C94C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
