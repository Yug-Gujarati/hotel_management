import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/screens/room/room_screen.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';
import '../common_screen.dart/profile_screen.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({super.key});

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  int isTapIndex = -1;
  String _selectedValue = '';
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
                        const Spacer(),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Add Room",
                          style: TextStyle(color: Color.fromARGB(255, 46, 33, 33), fontWeight: FontWeight.bold, fontSize: 24),
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
                          onTap: () {},
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
                      height: heightof * 0.8,
                      width: widthof,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
                        child: Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Floor:",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: heightof * 0.04,
                                  width: widthof * 0.4,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Add Floor",
                                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Room No:",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: heightof * 0.04,
                                  width: widthof * 0.4,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Add Room Number",
                                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Room Caegory:",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: heightof * 0.04,
                                  width: widthof * 0.4,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter a Type of Room",
                                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Room Location:",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: heightof * 0.04,
                                  width: widthof * 0.4,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter Room Side",
                                    hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 117, 117, 117),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Center the radio buttons
                              children: [
                                Text(
                                  "Booking Type: ",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Radio<String>(
                                  value: 'Non-AC',

                                  groupValue: _selectedValue,
                                  activeColor: Colors.red, // Set active color for Offline
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                      // Call callback
                                    });
                                  },
                                ),
                                Text(
                                  'Non-AC',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(width: 10),
                                Radio<String>(
                                  value: 'AC',
                                  groupValue: _selectedValue,
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'AC',
                                  style: TextStyle(color: Colors.black), // Text color
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightof * 0.35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isTapIndex = -1;
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => RoomScreen())));
                                    });
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    decoration: BoxDecoration(color: isTapIndex == -1 ? Colors.blue[800] : Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: isTapIndex == -1 ? Colors.white : Colors.black)),
                                    child: Center(
                                      child: Text(
                                        "Cancle",
                                        style: TextStyle(fontSize: 14, color: isTapIndex == -1 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isTapIndex = 0;
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => RoomScreen())));
                                    });
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 40,
                                    decoration: BoxDecoration(color: isTapIndex == 0 ? Colors.blue[800] : Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: isTapIndex == 0 ? Colors.white : Colors.black)),
                                    child: Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(fontSize: 14, color: isTapIndex == 0 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
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
