import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tenderglass/ui/profile.dart';
import 'package:tenderglass/ui/settings.dart';
import 'package:tenderglass/widgets/bottomnavbar.dart';
import 'package:tenderglass/widgets/tabbar.dart';

import '../animations/page_transition.dart';
import '../animations/slide_animation.dart';
import '../widgets/constants.dart';
import 'nft_screen.dart';
import 'onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _padding = 24;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'TenderLens',
          style: TextStyle(color: kblack),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsUI()));
              },
              child: Container(
                width: 40.r,
                height: 40.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: kwhite,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _Header(),
            ),
            SizedBox(height: 10.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding),
                child: _CategoryList()),
            SlideAnimation(
              begin: Offset(400.w, 0),
              child: SizedBox(
                height: 470,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: const NFTScreen(),
                              type: PageTransitionType.fadeIn,
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'TL. ',
                                    style: TextStyle(
                                      fontSize: 15.r,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'DAY 74',
                                    style: TextStyle(
                                      fontSize: 14.r,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '@Tinu Thampi',
                                    style: TextStyle(
                                      fontSize: 14.r,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Hero(
                              tag: '$index',
                              child: Container(
                                height: 320,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      index % 2 == 0
                                          ? 'assets/images/tender1.webp'
                                          : 'assets/images/tender2.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  EventStat(
                                    title: '20h: 25m: 08s',
                                    subtitle: 'Remaining Time',
                                  ),
                                  EventStat(
                                    title: '15.97 Lacs',
                                    subtitle: 'Lowest Bid',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatefulWidget {
  const _CategoryList({Key? key}) : super(key: key);

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<_CategoryList> {
  final List<String> items = const [
    'Trending',
    'Government',
    'PWD',
    'Health',
    'Real Estate',
    'Construction',
    'Railways',
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(5),
                    width: 90,
                    height: 35,
                    decoration: BoxDecoration(
                      color: current == index ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: GoogleFonts.laila(
                            fontWeight: FontWeight.w500,
                            color:
                                current == index ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            kheight5,
            Text(
              'Live',
              style: bodyTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              'Auctions',
              style: TextStyle(
                fontSize: 26.r,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Enjoy! The latest hot auctions',
              style: bodyTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
