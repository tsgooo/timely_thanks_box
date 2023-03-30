import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SentTBCard extends StatefulWidget {
  final DateTime date;
  final String text;
  final String name;
  final dynamic image;
  const SentTBCard({
    super.key,
    required this.date,
    required this.text,
    required this.name,
    this.image,
  });

  @override
  State<SentTBCard> createState() => _SentTBCardState();
}

class _SentTBCardState extends State<SentTBCard> {
  String determineDay() {
    String day = DateFormat('EEEE').format(widget.date);
    switch (day) {
      case 'Monday':
        return 'Даваа';
      case 'Tuesday':
        return 'Мягмар';
      case 'Wednesday':
        return 'Лхагва';
      case 'Thursday':
        return 'Пүрэв';
      case 'Friday':
        return 'Баасан';
      case 'Saturday':
        return 'Хагас сайн';
      case 'Sunday':
        return 'Бүтэн сайн';
      default:
        return 'Хоосон';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15,
      ),
      child: Container(
        // height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${determineDay()} гараг',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.date.toString().substring(0, 10)}, ',
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.date.toString().substring(11, 16),
                          style: const TextStyle(color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 4,
                      child: widget.image,
                    ),
                  ),
                  SizedBox(
                    // height: 100,
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      widget.text,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 25,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[500]),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.name}-д',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
