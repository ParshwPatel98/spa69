

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

  final snapcom=FirebaseFirestore.instance.collection("SPAS").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('spa');


