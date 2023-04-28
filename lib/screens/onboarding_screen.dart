import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tenderglass/screens/home.dart';

import '../animations/fade_animation.dart';
import '../animations/page_transition.dart';
import '../animations/slide_animation.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/constants.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  final double _padding = 40;
  final _headingStyle = const TextStyle(
    fontWeight: FontWeight.w200,
    fontFamily: 'Dsignes',
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _AppBar(),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 40.r,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dsignes',
                        color: Colors.black,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: 'Discover ',
                          style: _headingStyle,
                        ),
                        const TextSpan(
                          text: 'Tenders  ',
                        ),
                        TextSpan(
                          text: 'On ',
                          style: _headingStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Blockchain ',
                        style: TextStyle(
                          fontSize: 40.r,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                child: Text(
                  'Winning tenders with blockchain transparency - bid smarter, not harder with our app.',
                  style: bodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: _padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                      intervalStart: 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          EventStat(
                            title: '12.1K+',
                            subtitle: 'Tenders',
                          ),
                          EventStat(
                            title: '1.7M+',
                            subtitle: 'Bids',
                          ),
                          EventStat(
                            title: '45K+',
                            subtitle: 'Auction',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 60.w),
                  Expanded(
                    child: SlideAnimation(
                      intervalStart: 0.2,
                      child: FadeAnimation(
                        intervalEnd: 0.2,
                        child: Container(
                          padding: EdgeInsets.all(24.r),
                          decoration: const BoxDecoration(
                            color: Color(0xffe6d9fe),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const HomeScreen(),
                                      type: PageTransitionType.fadeIn,
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffcab2ff),
                                  ),
                                  child: const Icon(Iconsax.arrow_right_1),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                'Discover Tenders',
                                style: TextStyle(
                                  fontSize: 20.r,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 8,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Divider(
                                thickness: 2,
                                endIndent: 100.w,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            kheight30,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(left:130.0,top: 20),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 40.r,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Buy ',
                            style: _headingStyle,
                          ),
                          const TextSpan(
                            text: "NFT's " ,
                          ),
                          TextSpan(
                            text: 'On Our',
                            style: _headingStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: Row(
                    children: <Widget>[SizedBox(width: 40,),
                      Text(
                        'MarketPlace ',
                        style: TextStyle(
                          fontSize: 40.r,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                child: Text(
                  'Own a piece of the future with our NFT MarketPlace',
                  style: bodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 200.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  
                  SlideAnimation(
                    intervalStart: 0.2,
                    child: FadeAnimation(
                      intervalEnd: 0.2,
                      child: Container(width: 220,
                        padding: EdgeInsets.all(24.r),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 214, 245, 245),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child:  Home(),
                                    type: PageTransitionType.fadeIn,
                                  ),
                                );
                              },
                              child: Container(
                                width: 40.r,
                                height: 40.r,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 163, 215, 228),
                                ),
                                child: const Icon(Iconsax.arrow_right_1),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Buy The Future',
                              style: TextStyle(
                                fontSize: 20.r,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Divider(
                              thickness: 2,
                              endIndent: 100.w,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const AppLogo(),
        Container(
          width: 35.r,
          height: 35.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child:  Center(
            child: GestureDetector(onTap: (){
              Navigator.of(context).popAndPushNamed('/settings');
            },
              child: Icon(
                Iconsax.personalcard,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'TenderLens.',
      style: TextStyle(
        fontSize: 20.r,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ColoredText extends StatelessWidget {
  const ColoredText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            bottom: 0,
            left: 10.w,
            child: Container(
              width: 85.w,
              height: 30.r,
              color: const Color(0xffaafaff),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 40.r,
              fontWeight: FontWeight.bold,
              fontFamily: 'Dsignes',
              color: Colors.black,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class EventStat extends StatelessWidget {
  const EventStat({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.r,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.r,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
