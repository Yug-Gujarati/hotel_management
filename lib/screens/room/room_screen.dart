import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/screens/room/Aggregated.dart';
import 'package:hotel_management/screens/room/add_room.dart';
import 'package:hotel_management/screens/room/all_room.dart';
import 'package:hotel_management/screens/room/occupide.dart';
import 'package:hotel_management/screens/room/redy_for_booking.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';
import '../common_screen.dart/profile_screen.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<String> productCategories = [
    'All',
    'Redy For Booking',
    'Occupide',
    'Aggregated',
  ];
  late int currentPageIndex = 0;
  void initState() {
    super.initState();
    currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    var widthof = MediaQuery.of(context).size.width;
    Widget currentPage;

    switch (currentPageIndex) {
      case 0:
        currentPage = const AllRoom();
        break;
      case 1:
        currentPage = const RedyForBooking();
        break;
      case 2:
        currentPage = const OccupideRoom();
        break;
      case 3:
        currentPage = const AggregatedRoom();
      default:
        currentPage = const AllRoom();
        break;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          SvgPicture.asset(
            "asstes/Reset password – 1.svg",
            fit: BoxFit.fill,
          ),
          Container(
            color: Colors.black.withOpacity(0.05),
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
                        const Spacer(),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Room",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightof * 0.04,
                          width: widthof * 0.63,
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              // hintText: "What you want today",
                              label: const Text(
                                "Search here ",
                                style: TextStyle(fontSize: 12),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 15,
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddRoom()));
                          },
                          child: Container(
                            height: heightof * 0.04,
                            width: widthof * 0.23,
                            decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Add Room",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: heightof * 0.04,
                                  width: widthof * 0.82,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productCategories.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentPageIndex = index;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Container(
                                            child: Text(
                                              productCategories[index],
                                              style: TextStyle(
                                                color: currentPageIndex == index ? Colors.blue[800] : Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: heightof * 0.02,
                                  width: widthof * 0.04,
                                  decoration: BoxDecoration(color: Colors.lightGreenAccent[100], borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.green)),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "Redy For Booking",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: widthof * 0.03,
                                ),
                                Container(
                                  height: heightof * 0.02,
                                  width: widthof * 0.04,
                                  decoration: BoxDecoration(color: Colors.redAccent[100], borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.red)),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "Occupide",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: widthof * 0.03,
                                ),
                                Container(
                                  height: heightof * 0.02,
                                  width: widthof * 0.04,
                                  decoration: BoxDecoration(color: Colors.amberAccent[100], borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.amber)),
                                ),
                                SizedBox(
                                  width: widthof * 0.01,
                                ),
                                Text(
                                  "Aggregated",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.04,
                            ),
                            currentPage,
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
