import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/screens/staff/edit_staff.dart';
import 'package:hotel_management/screens/staff/filter.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';
import '../common_screen.dart/profile_screen.dart';
import 'add_new_staff.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  int selectedOrderIndex = -1;
  bool addNewCustomer = false;
  List<Map<String, String>> customers = [
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'HouseKeeping'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Security Gard'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Receptioniest'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Manager'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Receptioniest'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'HouseKeeping'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Security Gard'},
    {'Name': 'tomm dyx', 'Mobile': '123456789', 'Role': 'Security Gard'},
  ];

  void showFilter() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 20,
            width: 450,
            child: AlertDialog(
              backgroundColor: Colors.white,
              scrollable: true,
              surfaceTintColor: Colors.white,
              content: FilterForm(),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            ),
          );
        });
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
                            "Staff Detail",
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
                            width: widthof * 0.55,
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
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => AddNewStaff())));
                            },
                            child: Container(
                              height: heightof * 0.04,
                              width: widthof * 0.16,
                              decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  "Add new",
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              showFilter();
                            },
                            child: Container(
                              height: heightof * 0.04,
                              width: widthof * 0.16,
                              decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Filter",
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
                        height: heightof * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Mobile",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Role",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[800],
                                thickness: 0.5,
                              ),
                              Container(
                                height: heightof * 0.6,
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: customers.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedOrderIndex = index;
                                            Navigator.push(context, MaterialPageRoute(builder: ((context) => EditStaff())));
                                          });
                                        },
                                        child: Container(
                                          height: heightof * 0.04,
                                          decoration: BoxDecoration(
                                            color: selectedOrderIndex == index ? Colors.blue[100] : Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                customers[index]['Name']!,
                                                style: TextStyle(color: Colors.black, fontSize: 10),
                                              ),
                                              Spacer(),
                                              Text(
                                                customers[index]['Mobile']!,
                                                style: TextStyle(color: Colors.black, fontSize: 10),
                                              ),
                                              Spacer(),
                                              Text(
                                                customers[index]['Role']!,
                                                style: TextStyle(color: Colors.black, fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
