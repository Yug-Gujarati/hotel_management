import 'package:flutter/material.dart';

class RoomDetail extends StatefulWidget {
  const RoomDetail({super.key});

  @override
  State<RoomDetail> createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  List<Map<String, String>> rooms = [
    {
      'side': "Lake Side",
      'room': 'Free Room: 2',
    },
    {
      'side': "Garden Side",
      'room': 'Free Room: 1',
    },
    {
      'side': "Pool Side",
      'room': 'Free Room: 1',
    },
    {
      'side': "Road Side",
      'room': 'Free Room: 4',
    },
    {
      'side': "Airport Side",
      'room': 'Free Room: 2',
    },
    {
      'side': "60",
      'room': 'Total Rooms',
    },
  ];
  void showRoomUpdate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Currently no data update please check letter",
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: rooms.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final roomes = rooms[index];
          return InkWell(
            onTap: () {
              showRoomUpdate();
            },
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), gradient: LinearGradient(colors: [const Color.fromARGB(255, 2, 48, 118), Colors.blue])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    roomes['side']!,
                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    roomes['room']!,
                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
