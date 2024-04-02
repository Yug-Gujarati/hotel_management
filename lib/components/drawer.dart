import 'package:flutter/material.dart';
import 'package:hotel_management/screens/customer_screen.dart/customer_screen.dart';
import 'package:hotel_management/screens/dashboard/dashboard_screen.dart';
import 'package:hotel_management/screens/report/report_screen.dart';
import 'package:hotel_management/screens/room/room_screen.dart';
import 'package:hotel_management/screens/staff/staff_screen.dart';
import 'package:hotel_management/screens/vendor/vendor_screen.dart';
import '../screens/Auth/login_screen.dart';
import 'my_list_tiles.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    void dashboardPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ));
    }

    void customerPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerScreen(),
          ));
    }

    void staffPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StaffScreen(),
          ));
    }

    void vendorPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VendorScreen(),
          ));
    }

    void reportPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ReportScreen(),
          ));
    }

    void roomPage() {
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RoomScreen(),
          ));
    }

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: ListTile(
              leading: Container(
                height: MediaQuery.of(context).size.width * 0.10,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset(
                  "asstes/logo for navbar.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Column(
              children: [
                MyListTile(
                  svgPath: 'asstes/dashbord icon.svg',
                  text: "Dashboard",
                  onTap: () {
                    setState(() {
                      tappedIndex = 0;
                      dashboardPage();
                    });
                  },
                ),
                MyListTile(
                  svgPath: 'asstes/cusotmer icon.svg',
                  text: "Customer",
                  onTap: () {
                    setState(() {
                      tappedIndex = 1;
                      customerPage();
                    });
                  },
                ),
                MyListTile(
                  svgPath: 'asstes/staff icon.svg',
                  text: "Staff",
                  onTap: () {
                    setState(() {
                      tappedIndex = 2;
                      staffPage();
                    });
                  },
                ),
                MyListTile(
                  svgPath: 'asstes/vendor icon.svg',
                  text: "Vendor",
                  onTap: () {
                    setState(() {
                      tappedIndex = 3;
                      vendorPage();
                    });
                  },
                ),
                MyListTile(
                  svgPath: 'asstes/record icon.svg',
                  text: "Report",
                  onTap: () {
                    setState(() {
                      tappedIndex = 4;
                      reportPage();
                    });
                  },
                ),
                MyListTile(
                  svgPath: 'asstes/room icon.svg',
                  text: "Rooms",
                  onTap: () {
                    setState(() {
                      tappedIndex = 5;
                      roomPage();
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: ListTile(
              leading: Text(
                "Log Out",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              title: Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
