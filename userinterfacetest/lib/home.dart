import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
    );

    controller.repeat(reverse: true, period: Duration(seconds: 3));
    super.initState();
  }

  final LiquidController _controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final height = MediaQuery.of(context).size.height;

    final pages = [
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Text(
                  "Monthly budget",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.error,
                    color: Colors.blue.withOpacity(0.3),
                  )),
              Positioned(
                  top: height * 0.1,
                  child: Container(
                    width: width,
                    height: 40,
                    color: Colors.blue.withOpacity(0.1),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 0
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 0);
                                    });
                                  },
                                  child: const Text("Essentials",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 1
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 1);
                                    });
                                  },
                                  child: const Text("Wants",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 2
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 2);
                                    });
                                  },
                                  child: const Text("Savings",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                top: height * 0.2,
                child: SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: Colors.blue.withOpacity(0.3),
                        color: Colors.blue,
                        value: 0.7,
                        semanticsValue: "0.4",
                        minHeight: 6,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 6,
                          ),
                          Text("KES 5000 spent",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.blue.withOpacity(0.3),
                            radius: 6,
                          ),
                          Text("KES 6000 available",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue.withOpacity(0.2),
                            radius: 6,
                          ),
                          Text("KES 6000 unallocated",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * 0.3,
                left: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey,
                    child: Container(
                      width: width,
                      height: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor:
                                        Colors.brown.withOpacity(0.1),
                                    radius: 16,
                                    child: Icon(Icons.bus_alert_rounded,
                                        size: 20,
                                        color: Colors.brown.withOpacity(0.4))),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Transport",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.blue.withOpacity(0.3),
                                color: Colors.blue,
                                value: 0.4,
                                semanticsValue: "0.4",
                                minHeight: 6,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 6,
                                ),
                                Text("KES 5000 spent",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12)),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: Colors.blue.withOpacity(0.3),
                                  radius: 6,
                                ),
                                Text("KES 6000 available",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Text(
                  "Monthly budget",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.error,
                    color: Colors.blue.withOpacity(0.3),
                  )),
              Positioned(
                  top: height * 0.1,
                  child: Container(
                    width: width,
                    height: 40,
                    color: Colors.blue.withOpacity(0.1),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 0
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 0);
                                    });
                                  },
                                  child: const Text("Essentials",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 1
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 1);
                                    });
                                  },
                                  child: const Text("Wants",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 2
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 2);
                                    });
                                  },
                                  child: const Text("Savings",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )),
      Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Text(
                  "Monthly budget",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.error,
                    color: Colors.blue.withOpacity(0.3),
                  )),
              Positioned(
                  top: height * 0.1,
                  child: Container(
                    width: width,
                    height: 40,
                    color: Colors.blue.withOpacity(0.1),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 0
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 0);
                                    });
                                  },
                                  child: const Text("Essentials",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 1
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 1);
                                    });
                                  },
                                  child: const Text("Wants",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            child: Container(
                              width: width / 3.8,
                              height: 35,
                              color: _controller.currentPage == 2
                                  ? Colors.white
                                  : Colors.blue.withOpacity(0.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _controller.animateToPage(page: 2);
                                    });
                                  },
                                  child: const Text("Savings",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                top: height * 0.3,
                left: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.3,
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          color: Colors.blue,
                          value: 0.7,
                          semanticsValue: "0.4",
                          minHeight: 6,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 6,
                            ),
                            Text("KES 5000 spent",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12)),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.blue.withOpacity(0.3),
                              radius: 6,
                            ),
                            Text("KES 6000 available",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.4,
                left: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.3,
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          color: Colors.blue,
                          value: 0.7,
                          semanticsValue: "0.4",
                          minHeight: 6,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 6,
                            ),
                            Text("KES 5000 spent",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12)),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.blue.withOpacity(0.3),
                              radius: 6,
                            ),
                            Text("KES 6000 available",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    ];
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          liquidController: _controller,
          pages: pages,
        ),
      ),
    );
  }
}
