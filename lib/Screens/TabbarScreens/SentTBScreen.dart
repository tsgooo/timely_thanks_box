import 'package:flutter/material.dart';

import '../../Components/SentTBCard.dart';

class SentTBScreen extends StatefulWidget {
  const SentTBScreen({super.key});

  @override
  State<SentTBScreen> createState() => _SentTBScreenState();
}

class _SentTBScreenState extends State<SentTBScreen> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  List<dynamic> images = [
    Image.asset('assets/best-wishes.png'),
    Image.asset('assets/good-luck.png'),
    Image.asset('assets/great.png'),
    Image.asset('assets/thank-you.png'),
    Image.asset('assets/stay-strong.png'),
    Image.asset('assets/well-done.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 500,
                    child: ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return SentTBCard(
                          image: images[index],
                          date: DateTime.now(),
                          name: 'Борхүү',
                          text:
                              "Life is a journey full of ups and downs, but it's important to remember that every experience is an opportunity to learn and grow. Whether you're facing challenges or enjoying successes, cherish each moment and embrace the lessons they bring. Keep pushing forward and never give up on your dreams.",
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
