import 'package:flutter/material.dart';

import 'my_report.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
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

  void showMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_down_outlined,
                  color: Colors.green,
                  size: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Report Downloaded',
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final List<Map<String, String>> data = [
    {
      'date': '10-Jan-2024',
      'day': 'Wednesday',
    },
    {
      'date': '09-Jan-2024',
      'day': 'Tuesday  ',
    },
    {
      'date': '08-Jan-2024',
      'day': 'Monday   ',
    },
    {
      'date': '07-Jan-2024',
      'day': 'Sunday   ',
    },
    {
      'date': '06-Jan-2024',
      'day': 'Saturday ',
    },
    {
      'date': '05-Jan-2024',
      'day': 'Friday   ',
    },
    {
      'date': '04-Jan-2024',
      'day': 'Thursday ',
    }
  ];
  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        height: heightof * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Past 7 days",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: GestureDetector(
                onTap: () {
                  showMessage();
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final sale = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(sale['date']!),
                              SizedBox(
                                width: 30,
                              ),
                              Text(sale['day']!),
                              Spacer(),
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    "Get Report",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
