import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_management/screens/common_screen.dart/profile_screen.dart';

import '../../components/drawer.dart';
import '../common_screen.dart/notification/notification_screen.dart';
import 'vendor_screen.dart';

class EditVendor extends StatefulWidget {
  const EditVendor({super.key});

  @override
  State<EditVendor> createState() => _EditVendorState();
}

class _EditVendorState extends State<EditVendor> {
  int isTapIndex = -1;
  final List<String> Document = ['Aadhaar card', 'Pan card', 'Driving Lincense'];
  String selectedDocument = 'Aadhaar card';

  @override
  Widget build(BuildContext context) {
    var heightof = MediaQuery.of(context).size.height;
    var widthof = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const MyDrawer(),
        body: Stack(
          children: [
            SvgPicture.asset(
              "asstes/Reset password – 1.svg",
              fit: BoxFit.fill,
            ),
            Container(
              height: heightof,
              color: Colors.black.withOpacity(0.05), // Adjust opacity for blur intensity
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Builder(
                              builder: (context) => InkWell(
                                  child: SvgPicture.asset("asstes/menu icon.svg"),
                                  onTap: () {
                                    Scaffold.of(context).openDrawer();
                                  })),
                          const Spacer(),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            "Vendor Detail",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(child: SvgPicture.asset("asstes/notification icon.svg")),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Center(child: SvgPicture.asset("asstes/profile icon.svg")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: heightof * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30),
                          child: Form(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VendorScreen()));
                                      },
                                      icon: Icon(Icons.arrow_back)),
                                  Spacer(),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "aadi",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.06,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "bciud abfeyg cagefypeg babfegpr;a lufg GAEYGegfu y",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone no:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "8858567512",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email Add",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "aadi@gmail.com",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "GST no:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "8D8z5AA85EQw6751OPE2",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Document",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedDocument,
                                      items: Document.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
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
                                          selectedDocument = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upload Doc: ",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: heightof * 0.04,
                                      width: widthof * 0.4,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[50],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        child: Row(
                                          children: [Text("Select Image"), Spacer(), SvgPicture.asset("asstes/upload doc. icon.svg")],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shop Name:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "FF pillows",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service Provider:",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: heightof * 0.04,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: "Pillow, Curtains",
                                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
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
                                    )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isTapIndex = -1;
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => VendorScreen())));
                                      });
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 40,
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
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => VendorScreen())));
                                      });
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 40,
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
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
