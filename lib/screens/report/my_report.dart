import 'package:flutter/material.dart';

class MyReport extends StatefulWidget {
  const MyReport({super.key});

  @override
  State<MyReport> createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  int isTapIndex = -1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> options = ['Manager', 'Security Gard', 'HouseKeeping', 'Receptioniest'];
  String selectedValue = 'Manager';

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    var widthof = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5, top: 2, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Report",
                style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From:",
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    height: heightof * 0.065,
                    width: widthof * 0.4,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter detail';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[800],
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: "01-01-2024",
                        hintStyle: TextStyle(color: Colors.grey[800], fontSize: 20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formKey.currentState?.validate() == false ? Colors.red : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formKey.currentState?.validate() == false ? Colors.red : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorText: _formKey.currentState?.validate() == false ? 'Please enter detail' : null,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightof * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "To:",
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    height: heightof * 0.065,
                    width: widthof * 0.4,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Number detail';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey[800],
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: "07-01-2024",
                        hintStyle: TextStyle(color: Colors.grey[800], fontSize: 20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formKey.currentState?.validate() == false ? Colors.red : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formKey.currentState?.validate() == false ? Colors.red : Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        errorText: _formKey.currentState?.validate() == false ? 'Please Number detail' : null,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: heightof * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Type:",
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(
                    height: heightof * 0.065,
                    width: widthof * 0.4,
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      items: options.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                height: 20,
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
                      width: 110,
                      height: 35,
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
                      width: 110,
                      height: 35,
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
        ),
      ),
    );
  }
}
