import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_management/screens/common_screen.dart/profile_screen.dart';
import 'package:hotel_management/screens/dashboard/my_bar_chart.dart';
import 'package:hotel_management/screens/dashboard/rooms_detail.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    var widthof = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          SvgPicture.asset(
            "asstes/Reset password – 1.svg",
            fit: BoxFit.fill, // Adjust blur intensity
          ),
          Container(
            color: Colors.black.withOpacity(0.05), // Adjust opacity for blur intensity
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(
                            builder: (context) => InkWell(
                                child: SvgPicture.asset("asstes/menu icon.svg"),
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                })),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(child: SvgPicture.asset("asstes/notification icon.svg")),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Center(child: SvgPicture.asset("asstes/profile icon.svg")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Welome Back Admin,",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Your daily dashboard report here",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Average Profit",
                                  style: TextStyle(fontSize: 12, color: Colors.grey[900], fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: heightof * 0.03,
                                    width: widthof * 0.28,
                                    decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Last Week",
                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.008,
                            ),
                            Text(
                              "\$98,550.80",
                              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: heightof * 0.008,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.lightGreenAccent[100], borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      "asstes/Group 17.svg",
                                      height: heightof * 0.037,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "\$1,98,550.80",
                                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Average Income",
                                      style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: widthof * 0.15,
                                ),
                                Container(
                                  decoration: BoxDecoration(color: Colors.redAccent[100], borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      "asstes/Group 18.svg",
                                      height: heightof * 0.037,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "\$1,98,550.80",
                                      style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Average Income",
                                      style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Text(
                      "Overview",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: heightof * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: heightof * 0.08,
                              width: widthof * 0.15,
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
                              child: Center(
                                child: Text("11"),
                              ),
                            ),
                            Text("Arrival")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: heightof * 0.08,
                              width: widthof * 0.15,
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
                              child: Center(
                                child: Text("04"),
                              ),
                            ),
                            Text("Departure")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: heightof * 0.08,
                              width: widthof * 0.15,
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
                              child: Center(
                                child: Text("03"),
                              ),
                            ),
                            Text("Booking")
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: heightof * 0.08,
                              width: widthof * 0.15,
                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromARGB(255, 66, 66, 66))),
                              child: Center(
                                child: Text("42"),
                              ),
                            ),
                            Text("In-house")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Room Occupancy",
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: heightof * 0.03,
                            width: widthof * 0.28,
                            decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Container(
                      width: widthof,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Redy For Booking",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                LinearPercentIndicator(
                                  percent: 0.6,
                                  barRadius: Radius.circular(50),
                                  lineHeight: heightof * 0.016,
                                  width: widthof * 0.4,
                                  backgroundColor: Colors.grey[300],
                                  linearGradient: const LinearGradient(
                                    colors: [Color.fromARGB(255, 101, 218, 248), Color.fromARGB(255, 13, 71, 161)],
                                  ),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Occupied",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                LinearPercentIndicator(
                                  percent: 0.8,
                                  barRadius: Radius.circular(50),
                                  lineHeight: heightof * 0.016,
                                  width: widthof * 0.4,
                                  backgroundColor: Colors.grey[300],
                                  linearGradient: const LinearGradient(
                                    colors: [Color.fromARGB(255, 101, 218, 248), Color.fromARGB(255, 13, 71, 161)],
                                  ),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "42",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Aggregated",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                LinearPercentIndicator(
                                  percent: 0.4,
                                  barRadius: Radius.circular(50),
                                  lineHeight: heightof * 0.016,
                                  width: widthof * 0.4,
                                  backgroundColor: Colors.grey[300],
                                  linearGradient: const LinearGradient(
                                    colors: [Color.fromARGB(255, 101, 218, 248), Color.fromARGB(255, 13, 71, 161)],
                                  ),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "08",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.02,
                            ),
                            Container(
                              height: heightof * 0.16,
                              child: RoomDetail(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Booking Statistic",
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: heightof * 0.03,
                            width: widthof * 0.30,
                            decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Last 6 Month",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                    Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          )
                        ]),
                        child: My_Bar_Chart()),
                    SizedBox(
                      height: heightof * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
