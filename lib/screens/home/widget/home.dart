import 'package:course_app/constants/colors.dart';
import 'package:course_app/screens/home/widget/active_courses.dart';
import 'package:course_app/screens/home/widget/category_titel.dart';
import 'package:course_app/screens/home/widget/emoji_text.dart';
import 'package:course_app/screens/home/widget/other_levels.dart';
import 'package:course_app/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    super.initState();
    secureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Color(0xFFDAEFE8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmojiText(),
            SizedBox(
              height: 50,
            ),
            // SearchInput(),
            CatogaryTitel(leftText: "10".tr, rightText: ""),
            OtherLevels(),
            ActiveCourses(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launcherWhatsapp('+201025690635', "");
        },

        child: Icon(
          Icons.contact_support,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        //elevation: 0,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFDAEFE8),
      elevation: 0,
      centerTitle: false,
      title: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "1".tr,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.grey),
          ),
        ),
      ),
      actions: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 27),
              padding: EdgeInsets.all(1),
            ),
            Positioned(
                top: 15,
                right: 30,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(color: kAccent, shape: BoxShape.circle),
                )),
          ],
        )
      ],
      titleTextStyle: TextStyle(fontSize: 16, color: kFontLight),
    );
  }

  void launcherWhatsapp(@required phone, @required msg) async {
    String url = 'whatsapp://send?phone=$phone&text=$msg';
    await canLaunch(url) ? launch(url) : launch(url);
  }
}

class AppBAr extends StatelessWidget {
  const AppBAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
