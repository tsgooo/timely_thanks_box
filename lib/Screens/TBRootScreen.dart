import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irle_thanks_box/Screens/TabbarScreens/ReceivedTBScreen.dart';
import 'package:irle_thanks_box/Screens/TabbarScreens/SentTBScreen.dart';

import 'TBScreen.dart/TBScreen.dart';

class ThanksBoxScreen extends StatefulWidget {
  const ThanksBoxScreen({super.key});

  @override
  State<ThanksBoxScreen> createState() => _ThanksBoxScreenState();
}

class _ThanksBoxScreenState extends State<ThanksBoxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Талархалын хайрцаг'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 28,
          ),
        ),
        bottom: TabBar(
          indicator: const ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, width: 2.0, style: BorderStyle.solid),
            ),
          ),
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Хүлээн авсан',
            ),
            Tab(
              text: 'Илгээсэн',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ReceivedTBScreen(),
          SentTBScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Get.to(() => const TBScreen());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
