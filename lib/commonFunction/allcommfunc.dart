import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../User/BottomNavBar.dart';
import '../User/Login.dart';
import '../Vendor/VendorSpaLists.dart';
import 'dart:io';

import '../common/coomoonPath.dart';

class allfunc extends GetxController{
  final loading = false.obs;
  final addspaloading = false.obs;

  loginfunc(email,pass) async {

    final appstore = FirebaseFirestore.instance;
    try{
      loading(true);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      ).then((value) async {
        final userDoc = await appstore.collection("${email}profile").doc(email).get();
        // setState(() {
        //   typ = userDoc.get("type");
        // });
        SharedPreferences sf = await SharedPreferences.getInstance();
        sf.setString("umail", email);
        sf.setString("utype", userDoc.get("type"));

        if (userDoc.get("type") == 'USER') {
          Get.to(BottomNav());
        } else if (userDoc.get("type") == 'VENDOR') {
          Get.to(vendorspalists());
        }
        // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
      });
    }on FirebaseAuthException catch(e){
      Fluttertoast.showToast(
        msg: e.message.toString(),
      );
      loading(false);
    }finally{
      loading(false);
    }
  }

  signupfunc(email,pass,name,mobno,dropdownvalue) async {
    final appstore = FirebaseFirestore.instance;
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass
      ).then((value) {
        appstore.collection("${email.text}profile").doc(email.text).set({
          "Name":name,"mobno":mobno,"email":email,"type":dropdownvalue
        });
        Get.to(LoginPage());
      });
    }on FirebaseAuthException catch (e){
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  forgotpassfunc(email){
    try{
      FirebaseAuth.instance.sendPasswordResetEmail(
          email: email
      ).then((value) {
        Get.to(LoginPage());
      });
    }on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  addspa(spaName,location,dropdownvalue,File profile_photo) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try{
      addspaloading(true);

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("${auth.currentUser!.email.toString()}spa").child("images/${spaName}");
      UploadTask uploadTask = ref.putFile(profile_photo);
      await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
      String imageURL = await ref.getDownloadURL();
      print('Download URL: $imageURL');

      QuerySnapshot snap =  await snapcom.get();
      int count = snap.docs.length;

      await snapcom.doc('${count+1}').set({
        'id':'${count+1}',
        'spaname':spaName,
        'location':location,
        'available':dropdownvalue,
        'imgurl':imageURL.toString()
      }).then((value){
        Get.back();
      });
    }on FirebaseException catch(e){
      Fluttertoast.showToast(msg: e.message.toString());
      addspaloading(false);
    }finally{
      addspaloading(false);
    }
  }
}