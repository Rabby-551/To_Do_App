import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoProWidget extends StatelessWidget {
  const GoProWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      color: const Color(0xff9EB031),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Go Pro (No Ads)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 0,
                    ),
                  ),
                  Text(
                    'No fuss, no ads, for only \$1 a\nmonth',
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
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