import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/drawer.dart';
import 'notification/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int isTapIndex = -1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            color: Colors.black.withOpacity(0.05), // Adjust opacity for blur intensity
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Spacer(),
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 350,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          // hintText: "What you want today",
                          label: Text(
                            "Search here",
                            style: TextStyle(fontSize: 14),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightof * 0.01,
                    ),
                    Container(
                      height: heightof * 0.8,
                      width: widthof * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "You can change your current password",
                                style: TextStyle(color: Colors.grey[900], fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: heightof * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Old Password : ",
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightof * 0.05,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                      // controller: controller.emailController.value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                                        hintText: "123456879",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        errorText: _formKey.currentState?.validate() == false ? 'Enter password' : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "New Password : ",
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightof * 0.05,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                      // controller: controller.emailController.value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                                        hintText: "789456132",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        errorText: _formKey.currentState?.validate() == false ? 'Enter Password' : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Confirm Password : ",
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightof * 0.05,
                                    width: widthof * 0.4,
                                    child: TextFormField(
                                      // controller: controller.emailController.value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                                        hintText: "789456123",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        errorText: _formKey.currentState?.validate() == false ? 'Enter Password' : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightof * 0.45,
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
                                      width: 150,
                                      height: 35,
                                      decoration: BoxDecoration(color: isTapIndex == -1 ? Colors.blue[800] : Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: isTapIndex == -1 ? Colors.white : Colors.black)),
                                      child: Center(
                                        child: Text(
                                          "Cancle",
                                          style: TextStyle(fontSize: 20, color: isTapIndex == -1 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
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
                                      width: 150,
                                      height: 35,
                                      decoration: BoxDecoration(color: isTapIndex == 0 ? Colors.blue[800] : Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: isTapIndex == 0 ? Colors.white : Colors.black)),
                                      child: Center(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(fontSize: 20, color: isTapIndex == 0 ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
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
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
