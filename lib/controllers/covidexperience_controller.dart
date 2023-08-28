import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moca/controllers/firebase_const.dart';

class CovidExperienceController extends GetxController {
  String pcrTest = '';
  String pcrTestDetails = '';
  String covid = '';
  String result = '';
  String duration = '';
  String first4weeks = '';
  String week4Experience = '';

  Future<bool> submitForm({
    pcrTest,
    covid,
    result,
    duration,
    first4weeks,
    week4Experience,
    pcrTestDetails,
  }) async {
    debugPrint('submitForm() called');
    try {
      ///storing page info if page has been used of user in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .set({
        'pages': FieldValue.arrayUnion(['covid_experience']),
      }, SetOptions(merge: true));
      ////storing data of user in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'covid_experience': {
          'pcrTest': pcrTest,
          'covid': covid,
          'results': result,
          'duration': duration,
          'first4weeks': first4weeks,
          'week4Experience': week4Experience,
          'pcrTestDetails': pcrTestDetails,
          'id': currentUser!.uid,
        }
      });
      //     .collection('covid_experience')
      //     .doc('data')
      //     .set({
      //   'pcrTest': pcrTest,
      //   'covid': covid,
      //   'results': result,
      //   'duration': duration,
      //   'first4weeks': first4weeks,
      //   'week4Experience': week4Experience,
      //   'pcrTestDetails': pcrTestDetails,
      //   'id': currentUser!.uid,
      // });
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  Future<bool> submitFormMethod({
    pcrTest,
    covid,
    result,
    duration,
    first4weeks,
    week4Experience,
    pcrTestDetails,
  }) async {
    try {
      debugPrint('submitForm() called');
      bool? check = await submitForm(
        pcrTest: pcrTest,
        covid: covid,
        result: result,
        duration: duration,
        first4weeks: first4weeks,
        week4Experience: week4Experience,
        pcrTestDetails: pcrTestDetails,
      );
      if (check == false) {
        debugPrint('ERROR is storing data!');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
