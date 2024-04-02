import 'package:flutter/material.dart';

import 'date_picker.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({super.key});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final List<String> options = ['Online', 'Offline'];
  String selectedValue = 'Online';
  int isTapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Date: ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
              ),
              Spacer(),
              CustomDatePicker(labelText: "From:", dateController: fromDateController)
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [Spacer(), CustomDatePicker(labelText: "To: ", dateController: toDateController)],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Text(
                "Booking Type: ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                width: 150,
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  hint: Text('Select Mode'),
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    hintText: "Select Mode",
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
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isTapIndex = -1;
                  });
                },
                child: Container(
                  width: 120,
                  height: 30,
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
                  });
                },
                child: Container(
                  width: 120,
                  height: 30,
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
      ),
    );
  }
}
