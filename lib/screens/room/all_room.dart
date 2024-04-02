import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/screens/customer_screen.dart/add_new_customer.dart';
import 'package:hotel_management/screens/room/customer_detail.dart';
import 'package:hotel_management/screens/room/room_status.dart';

class AllRoom extends StatefulWidget {
  const AllRoom({super.key});

  @override
  State<AllRoom> createState() => _AllRoomState();
}

class _AllRoomState extends State<AllRoom> {
  void showDetail(String roomNumbers, String floors, Color bC) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: CustomerDetail(
            roomNumber: roomNumbers,
            floor: floors,
            borderColor: bC,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    final List<Color> borderColors = [
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    final int totalFloors = 5;
    final List<List<RoomData>> roomsByFloor = [];
    for (int floor = 1; floor <= totalFloors; floor++) {
      roomsByFloor.add(List.generate(
          8,
          (index) => RoomData(
                roomNumber: '${floor * 100 + index + 1}',
                color: [
                  const Color.fromARGB(255, 255, 138, 128),
                  const Color.fromARGB(255, 185, 246, 202),
                  const Color.fromARGB(255, 255, 229, 127),
                ][index % 3],
              )));
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int floor = 1; floor <= totalFloors; floor++) ...[
              Text(
                "Floor $floor",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: heightof * 0.02,
              ),
              Container(
                height: heightof * 0.2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: roomsByFloor[floor - 1].length, // Access by floor index
                  itemBuilder: (context, index) {
                    final room = roomsByFloor[floor - 1][index]; // Access by floor index
                    final borderColor = borderColors[index % 3];
                    return GestureDetector(
                      onTap: () {
                        if (room.color == const Color.fromARGB(255, 185, 246, 202)) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewCustomer()));
                        } else {
                          showDetail(room.roomNumber, "${floor}", borderColor);
                        }
                      },
                      child: DottedBorder(
                        stackFit: StackFit.expand,
                        color: borderColor,
                        strokeWidth: 2.0,
                        dashPattern: [5, 3, 5, 3],
                        strokeCap: StrokeCap.round,
                        radius: Radius.circular(20),
                        borderPadding: EdgeInsets.all(1),
                        borderType: BorderType.RRect,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: room.color,
                          ),
                          child: Center(
                            child: Text(
                              room.roomNumber,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: heightof * 0.02, // Optional spacing between floors
              ),
            ],
          ],
        ),
      ),
    );
  }
}
