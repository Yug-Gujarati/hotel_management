import 'package:flutter/material.dart';

class NotificationMessage extends StatelessWidget {
  const NotificationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("asstes/profile.jpg"),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'vibhav bhai', // Replace with the actual name
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              Text(
                'This is a sample message.', // Replace with the actual message
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ],
          ),
          Spacer(),
          Text(
            '2 min', // Replace with the actual text
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
