import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String labelText;
  final TextEditingController dateController;

  const CustomDatePicker({
    required this.labelText,
    required this.dateController,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        final formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate!);
        widget.dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 200,
      child: TextField(
        controller: widget.dateController,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          hintText: widget.labelText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: InkWell(
              onTap: _selectDate,
              child: Container(
                height: 1,
                width: 1,
                child: SvgPicture.asset(
                  "asstes/calender icon.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
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
        ),
      ),
    );
  }
}
