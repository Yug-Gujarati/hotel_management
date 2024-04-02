import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyListTile extends StatefulWidget {
  final String svgPath;
  final String text;
  final void Function()? onTap;

  MyListTile({
    Key? key,
    required this.svgPath,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 15),
      child: SizedBox(
        height: heightof * 0.06,
        child: ListTileTheme(
          child: ListTile(
            leading: SvgPicture.asset(
              widget.svgPath,
              color: tapped ? Colors.blue : Colors.black,
              height: MediaQuery.of(context).size.width * 0.04,
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            onTap: () {
              setState(() {
                tapped = !tapped;
              });
              widget.onTap?.call();
            },
            title: Text(
              widget.text,
              style: TextStyle(color: tapped ? Colors.blue : Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
