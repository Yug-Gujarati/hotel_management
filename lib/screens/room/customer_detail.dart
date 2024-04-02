import 'package:flutter/material.dart';

class CustomerDetail extends StatelessWidget {
  final String roomNumber;
  final String floor;
  final Color borderColor;
  const CustomerDetail({Key? key, required this.roomNumber, required this.floor, required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    return Container(
      height: heightof * 0.45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: borderColor)),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Room Information ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: heightof * 0.005,
            ),
            SizedBox(height: 10.0),
            _buildInfoRow(label: "Room No", value: roomNumber),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Floor No", value: floor),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Room Type", value: "Couple Room"),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Room Location", value: "City side"),
            _buildInfoRow(label: "Amenities", value: "AC"),
            SizedBox(
              height: heightof * 0.03,
            ),
            Row(
              children: [
                Text(
                  "Customer Information ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: heightof * 0.005,
            ),
            SizedBox(height: 10.0),
            _buildInfoRow(label: "customer Name", value: "XYZ"),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Custoemr Type", value: "Offline"),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Date From", value: "28-1-2024"),
            SizedBox(height: 5.0),
            _buildInfoRow(label: "Date To", value: "31-1-2024"),
          ],
        ),
      ),
    );
  }

  Row _buildInfoRow({required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Text(label)),
        Text(":  "),
        Expanded(child: Text(value)),
      ],
    );
  }
}
