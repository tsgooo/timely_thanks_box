import 'package:flutter/material.dart';

class ReceivedTBCard extends StatefulWidget {
  final dynamic image;
  final String text;
  final String name;
  final DateTime date;
  final Color color1;
  final Color color2;
  const ReceivedTBCard({
    super.key,
    this.image,
    required this.text,
    required this.name,
    required this.date,
    required this.color1,
    required this.color2,
  });

  @override
  State<ReceivedTBCard> createState() => _ReceivedTBCardState();
}

class _ReceivedTBCardState extends State<ReceivedTBCard> {
  Future<dynamic> showCard() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  widget.color1,
                  widget.color2,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: widget.image,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '"${widget.text}"',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    '${widget.name}-c',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCard();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 12.0, right: 12),
        child: Container(
          // height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: widget.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          '"${widget.text}"',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 100,
                          textAlign: TextAlign.justify,
                          // textAlign: ,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${widget.name}-c',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 80),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.date.toString().substring(0, 19),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
