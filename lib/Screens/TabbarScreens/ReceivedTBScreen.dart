import 'package:flutter/material.dart';
import 'package:irle_thanks_box/Components/ReceivedTBCard.dart';

class ReceivedTBScreen extends StatefulWidget {
  const ReceivedTBScreen({super.key});

  @override
  State<ReceivedTBScreen> createState() => ReceivedTBScreenState();
}

class ReceivedTBScreenState extends State<ReceivedTBScreen> {
  List<dynamic> images = [
    Image.asset('assets/best-wishes.png'),
    Image.asset('assets/good-luck.png'),
    Image.asset('assets/great.png'),
    Image.asset('assets/thank-you.png'),
    Image.asset('assets/stay-strong.png'),
    Image.asset('assets/well-done.png'),
  ];
  List<List<Color>> colors = [
    [Colors.amber, Colors.amberAccent],
    [Colors.purple, Colors.yellow],
    [Colors.blue, Colors.yellow],
    [Colors.yellow, Colors.blue],
    [Colors.purpleAccent, Colors.yellowAccent],
    [Colors.blue, Colors.purpleAccent],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ReceivedTBCard(
                  color1: colors[index][0],
                  color2: colors[index][1],
                  text:
                      ' understand and analyze text, as well as generate new content based on the input I receive. I can assist with various tasks, from answering questions to generating creative writing.',
                  name: 'Солонго',
                  image: images[index],
                  date: DateTime.now(),
                );
              },
            ),
          ),
          // const SizedBox(height: 100),
        ],
      ),
    );
  }
}
