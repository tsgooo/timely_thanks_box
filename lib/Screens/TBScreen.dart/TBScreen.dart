import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/TextStyle.dart';

class TBScreen extends StatefulWidget {
  const TBScreen({super.key});

  @override
  State<TBScreen> createState() => _TBScreenState();
}

class _TBScreenState extends State<TBScreen> {
  @override
  void initState() {
    super.initState();
    // pragma
  }

  // final size = MediaQuery.of(context).size
  List<dynamic> images = [
    Image.asset('assets/best-wishes.png'),
    Image.asset('assets/good-luck.png'),
    Image.asset('assets/great.png'),
    Image.asset('assets/thank-you.png'),
    Image.asset('assets/stay-strong.png'),
    Image.asset('assets/well-done.png'),
  ];
  List<List<Color>> colors = [
    [Colors.amber[800]!, Colors.amberAccent],
    [Colors.purple, Colors.yellow],
    [Colors.blue, Colors.yellow],
    [Colors.yellow, Colors.blue],
    [Colors.purpleAccent, Colors.yellowAccent],
    [Colors.blue, Colors.purpleAccent],
  ];
  bool tapped = false;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text('Талархалын хайрцаг'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/letterbox.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      // right: 10,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          const Text('Сэтгэлийн бэлэг илгээгээрэй',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                          Text(
                            'Та өөрийн хамтран ажиллагч багийн найздаа талархсан сэтгэгдлээ илэрхийлэх бол энэхүү хайрцагийг ашиглаад илгээгээрэй',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Хэнд зориулсан',
                style: TextStyles().subtitleStyle,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Хэлтэс сонгох',
                        style: TextStyle(
                          color: Colors.grey[700],
                          // fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Ажилтан сонгох',
                        style: TextStyle(
                          color: Colors.grey[700],
                          // fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Талархал',
                style: TextStyles().subtitleStyle,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Талархлаа бичнэ үү',
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Загвар',
                style: TextStyles().subtitleStyle,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // print('$index Lllllllllllllllll');
                      setState(() {
                        num = index;
                        tapped = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: !tapped
                                ? Colors.white
                                : index == num
                                    ? Colors.deepPurple
                                    : Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  colors[index][0],
                                  colors[index][1],
                                ],
                              ),
                            ),
                            height: 80,
                            width: 80,
                            child: images[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print("${MediaQuery.of(context).size.width} lllll ");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Илгээх',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
