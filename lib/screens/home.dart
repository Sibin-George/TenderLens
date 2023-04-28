import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenderglass/screens/post.dart';
import 'package:tenderglass/widgets/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _controller;
  List post_item = [
    ['ali', 'power', '10', '1', '2', '1K', 'h2.png', '20', '2'],
    ['alireza', 'reach', '50', '3', '4', '1K', 'h2.png', '30', '5'],
    ['abdoul', 'pore', '20', '2', '2', '1K', 'h1.png', '20', '2'],
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
 getData ()async {
    var url = Uri.parse("http://192.168.34.221:8080/");
    var response = await http.get(url);
    var res = jsonDecode(response.body);
    log(res.toString());
    return res;
}
var data = getData();

    return Scaffold(
      backgroundColor: const Color(0xfff4f6f8),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      app_bar(),
                      const SizedBox(height: 24),
                      more(),
                      const SizedBox(height: 10),
                      tabbar(),
                      const SizedBox(height: 10),
                      ...post_generate(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> post_generate() {
    return List.generate(
      3,
      (index) => Post(
        creator: post_item[index][0],
        name: post_item[index][1],
        price: post_item[index][2],
        image: post_item[index][3],
        day: post_item[index][4],
        follower: post_item[index][5],
        creator_image: post_item[index][6],
        minutes: post_item[index][7],
        hours: post_item[index][8],
      ),
    );
  }

  Widget tabbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TabBar(
        controller: _controller,
        labelColor: Colors.grey.shade700,
        unselectedLabelColor: Colors.grey.shade500,
        indicatorColor: const Color(0xffF35383),
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: [
          const Tab(
            text: 'New',
          ),
          const Tab(
            text: 'Art',
          ),
          const Tab(
            text: 'Game',
          ),
          const Tab(
            text: 'Music',
          ),
        ],
      ),
    );
  }

  Padding more() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Live auctions',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              const Text(
                'more',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const Icon(Icons.arrow_right_sharp)
            ],
          )
        ],
      ),
    );
  }

  Padding app_bar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/p3.png'),
          ),
          Row(
            children: [
                 Container(width: 270,
                   child: CupertinoSearchTextField(
                        suffixIcon: Icon(CupertinoIcons.xmark_circle_fill),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            return;
                          }   
                          // data(value) ; 
                                             
                        },
                      ),
                 ),
            
            ],
          )
        ],
      ),
    );
  }
}
