import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/constants/colors.dart';
import 'package:course_app/screens/courses/material.dart';
import 'package:course_app/screens/home/search_screen.dart';
import 'package:course_app/view_model/material_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../courses/doctors.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  searchResultList() {
    var showResult = [];
    if (_searchController.text != "") {
      for (var CorssessSnapShot in _allResult) {
        var name = CorssessSnapShot["name"].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResult.add(CorssessSnapShot);
        }
      }
    } else {
      showResult = List.from(_allResult);
    }
    setState(() {
      _resultList = showResult;
    });
  }

  List _allResult = [];
  List _resultList = [];
  getCorssessStream() async {
    var data = await FirebaseFirestore.instance
        .collection("courses")
        .orderBy("name")
        .get();

    setState(() {
      _allResult = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController..dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getCorssessStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFDAEFE8),
        appBar: AppBar(
          backgroundColor: Color(0xFFDAEFE8),
          elevation: 0,
          title: CupertinoSearchTextField(controller: _searchController),
        ),
        body: ListView.builder(
            itemCount: _resultList.length,
            itemBuilder: ((context, index) {
              DocumentSnapshot posts = _resultList[index];
              return InkWell(
                onTap: () {
                  Get.to(DoctorsViewScreen(
                    course: posts['name'],
                  ));
                },
                child: ListTile(
                  title: Text(_resultList[index]["name"]),
                ),
              );
            })));
  }
}
