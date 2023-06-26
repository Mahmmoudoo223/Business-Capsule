import 'package:course_app/helper/text_form.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.off(BottomBar());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text("Edit Profile",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: TextForm(
                      controller: passwordController,
                      text: "Enter new Password",
                      textinputtype: TextInputType.emailAddress,
                      obscure: true,
                      onSave: (value) {},
                      validator: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: TextForm(
                      controller: conpasswordController,
                      text: "Confirm new Password",
                      textinputtype: TextInputType.emailAddress,
                      obscure: true,
                      onSave: (value) {},
                      validator: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.off(ProfileScreen());
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
