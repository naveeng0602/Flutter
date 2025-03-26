import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //Create Data

  Future addEmployeeDetails(
    Map<String, dynamic> employeeInfoMap,
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Emplayee")
        .doc(id)
        .set(employeeInfoMap);
  }

  // Read Data

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Emplayee").snapshots();
  }

  //Update Data

  Future updateEmployeeDetail(
    String id,
    Map<String, dynamic> updateInfo,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Emplayee")
        .doc(id)
        .update(updateInfo);
  }

  // Delete Data

  Future deleteEmployeeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Emplayee")
        .doc(id)
        .delete();
  }
}
