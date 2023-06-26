

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/helper/local_storge_data.dart';

import 'package:course_app/servies/firestore_user.dart';
import 'package:course_app/view_model/controle_view.dart';
import 'package:course_app/view_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthViewModel extends GetxController {


  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorgeData localStorgeData = Get.find();
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }




  void signInWithEmailAndPassword() async {
    final box = GetStorage();
  //  String name1=box.read('name')??"";
    String email1=box.read('email')??"";

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print("ccc=======");
            //print(value.user!.displayName.toString());
            var collection = FirebaseFirestore.instance.collection('user');
            print("ccc======="+collection.toString());
            var docSnapshot = await collection.doc(value.user!.uid).get();
        print("ccc======="+docSnapshot.toString());
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) async {
         // print("vvv="+value.toString());

          if (docSnapshot.exists) {

            Map<String, dynamic>? data = docSnapshot.data();
            var valuex = data?['log'];
            print("vvv=========="+valuex.toString());
            final CollectionReference _updates =
            FirebaseFirestore.instance.collection('user');

         //   print("up=="+_updates.toString());

            if(valuex<=2){

            //  setUser(UserModel.fromJson(value?.data() as Map<dynamic, dynamic>));

              await _updates
                  .where('email',isEqualTo:email)
                  .get().then((snapshot) {
                snapshot.docs.last.reference.update({
                  'log':valuex+1,
                  //'price':price,
                }).then((value) {

                  Get.offAll(ControleView());
                });
              });//
            }

            else{
              Get.snackbar('Wrong', "Maximum Devices 2",
              colorText:Colors.white,
                backgroundColor: Colors.red
              );
            }

            // Call setState if needed.
          }
          else{

            print("xxx");

          }



          // await FirebaseFirestore.instance.collection('user').add({
          //   "log":"1",
          // });


          if(email1==""){
            box.write('email', email);
          }

        });
      });


    } catch (e) {
      print(e.toString());

      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signupWithEmailAndPassword() async {
    final box = GetStorage();

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {

            print("e=="+email);
            print("e=="+name);

        box.write('email', email);
        box.write('name', name);

        saveUser(user);
        Get.offAll(ControleView());
      });


    }



    catch (e) {
      print(e.toString());
      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }



  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(email, name, user.user!.uid, "",false,1,[]);

    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }


  void setUser(UserModel userModel) async {
    await localStorgeData.setUser(userModel);
  }
}
