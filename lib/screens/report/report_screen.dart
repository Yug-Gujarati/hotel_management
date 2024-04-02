import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/screens/report/customer_screen.dart';
import 'package:hotel_management/screens/report/my_report.dart';
import 'package:hotel_management/screens/report/vendor_screen.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';
import '../common_screen.dart/profile_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int showForm1 = -1;
  int isTapIndex = -1;
  void reportShow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: MyReport(),
        );
      },
    );
  }

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
            fit: BoxFit.fill,
          ),
          Container(
            height: heightof,
            color: Colors.black.withOpacity(0.05), // Adjust opacity for blur intensity
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                          "Vendor Detail",
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
                            reportShow();
                          },
                          child: Container(
                            height: heightof * 0.04,
                            width: widthof * 0.20,
                            decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Add new",
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isTapIndex = -1;
                                      showForm1 = -1;
                                    });
                                  },
                                  child: Text(
                                    "Customer",
                                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: isTapIndex == -1 ? FontWeight.bold : FontWeight.normal),
                                  )),
                              Container(
                                height: 20,
                                width: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isTapIndex = 0;
                                      showForm1 = 0;
                                    });
                                  },
                                  child: Text(
                                    "Vender",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: isTapIndex == 0 ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  )),
                            ],
                          ),
                          if (showForm1 == -1) CustomerScreen() else VenderScreen()
                        ],
                      ),
                    ),
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
