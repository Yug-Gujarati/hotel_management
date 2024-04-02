import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_management/screens/common_screen.dart/profile_screen.dart';
import '../../../components/drawer.dart';
import 'notification_message.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        children: [
          SvgPicture.asset(
            "asstes/Reset password – 1.svg",
            fit: BoxFit.fill,
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
                        const Spacer(),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
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
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              Text(
                                "Yesterday",
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              Text(
                                "1 week ago",
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                              NotificationMessage(),
                            ],
                          ),
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
