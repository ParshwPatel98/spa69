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
import '../Vendor/VendorHomeScreen.dart';
import '../Vendor/VendorSpaLists.dart';
import 'dart:io';
import '../common/coomoonPath.dart';

class allfunc extends GetxController{
  final loading = false.obs;
  final addspaloading = false.obs;
  final signuploading = false.obs;
  final addtherapistloading = false.obs;
  final addservicesloading = false.obs;

  loginfunc(email,pass,dropdownvalue) async {

    final appstore = FirebaseFirestore.instance;
    try{
      loading(true);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
      ).then((value) async {
        final userDoc = await appstore.collection(dropdownvalue).doc(email).get();
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


    if(dropdownvalue == 'VENDOR'){
      try{
        signuploading(true);
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: pass
        ).then((value) {
          // appstore.collection("${email.text}profile").doc(email.text).set({
          //   "Name":name,"mobno":mobno,"email":email,"type":dropdownvalue
          // }
          appstore.collection(dropdownvalue).doc(email).set({
            "Name":name,"mobno":mobno,"email":email,"type":dropdownvalue
          });
          Get.to(LoginPage());
        });
      }on FirebaseAuthException catch (e){
        Fluttertoast.showToast(msg: e.message.toString());
        signuploading(false);
      }finally{
        signuploading(false);
      }
    }else{
      try{
        signuploading(true);
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: pass
        ).then((value) {
          // appstore.collection("${email.text}profile").doc(email.text).set({
          //   "Name":name,"mobno":mobno,"email":email,"type":dropdownvalue
          // }
          appstore.collection(dropdownvalue).doc(email).set({
            "Name":name,"mobno":mobno,"email":email,"type":dropdownvalue
          });
          Get.to(LoginPage());
        });
      }on FirebaseAuthException catch (e){
        Fluttertoast.showToast(msg: e.message.toString());
        signuploading(false);
      }finally{
        signuploading(false);
      }
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

  addspa(spaName,apartment,dropdownvalue,File spa_photo,email,utype,area,city) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try{
      addspaloading(true);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("${auth.currentUser!.email.toString()}spa").child("images/${spaName}");
      UploadTask uploadTask = ref.putFile(spa_photo);
      await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
      String spaURL = await ref.getDownloadURL();
      print('Download URL: $spaURL');

      QuerySnapshot snap = await FirebaseFirestore.instance.collection(utype).doc(email).collection("Spas").get();
      int count = snap.docs.length;
      await FirebaseFirestore.instance.collection(utype).doc(email).collection("Spas").doc("${email}${count+1}").set({
        'id':"${email}${count+1}",
        "spaName":spaName,
        "apartmnet":apartment,
        "available":dropdownvalue,
        "imgURL":spaURL.toString(),
        "area": area,
        "city":city,
      }).then((value) {
        Get.back();
      });
    }on FirebaseException catch(e){
      Fluttertoast.showToast(msg: e.message.toString());
      addspaloading(false);
    }finally{
      addspaloading(false);
    }
    // Get.back();


  }
  addtherapiest (email,_therapiest_name,_therapiest_title,_therapiest_working_days,_therapiest_working_hours,spaName,spaId,File therapist_photo) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try{
      addtherapistloading(true);
      print("data adding in progress");
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("${auth.currentUser!.email.toString()}spa").child("images/${spaName}").child(_therapiest_name);
      UploadTask uploadTask = ref.putFile(therapist_photo);
      await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
      String therapistURL = await ref.getDownloadURL();
      print('Download URL: $therapistURL');
      print("photo uploaded");


      QuerySnapshot snapadd = await FirebaseFirestore.instance.collection('VENDOR').doc(email).collection("Spas").doc(spaId).collection('therapiest').get();
      int countadd = snapadd.docs.length;
      FirebaseFirestore.instance.collection("VENDOR").doc(email).collection("Spas").doc(spaId).collection('therapiest').doc('${countadd+1}').set({
                  'id': '${countadd + 1}',
                  'name':_therapiest_name,
                  'title':_therapiest_title,
                  'working_days':_therapiest_working_days,
                  'working_hours':_therapiest_working_hours,
                  'imgURl':therapistURL.toString(),
      }).then((value) {
        Get.back();
      });


    }on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message.toString());
      addtherapistloading(false);
    }finally{
      addtherapistloading(false);
    }

  }

  addservices(utype,email,spaName,_therapiest_name,File _service_photo,spaId,_add_services,_description,_add_price,_selectedIndex) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try{
        addservicesloading(true);
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage.ref().child("${_auth.currentUser!.email.toString()}spa").child("images/${spaName}").child(_therapiest_name).child("service");
        UploadTask uploadTask = ref.putFile(_service_photo);
        await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
        String serviceImageURL = await ref.getDownloadURL();
        // print('Download URL: $imageURL');
        print("photo uploaded");


        // QuerySnapshot snap = await FirebaseFirestore.instance.collection(utype).doc(email).collection("Spas").get();
        // int count = snap.docs.length;
        QuerySnapshot snapadd = await FirebaseFirestore.instance.collection(utype).doc(email).collection("Spas").doc("${spaId}").collection('therapiest').get();
        int countadd = snapadd.docs.length;
        FirebaseFirestore.instance.collection(utype).doc(email).collection("Spas").doc("${spaId}").collection('services').doc().set({

          'service_name':_add_services,
          'service_description':_description,
          'service_price':_add_price,
          'service_img':serviceImageURL,
          'selected_terapiest':_selectedIndex,
        }).then((value) {
          Get.back();

        });


      }on FirebaseAuthException catch(e){
        Fluttertoast.showToast(msg: e.message.toString());
        addservicesloading(false);
      }finally{
      addservicesloading(false);
    }

    }



}