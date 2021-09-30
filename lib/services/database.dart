import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  updateTask(String userId, Map<String, dynamic> taskMap, String documentId) {
    FirebaseFirestore.instance
        .collection("tasks")
        .doc(documentId)
        .set(taskMap, SetOptions(merge: true));
  }

  createTask(String userId, Map<String, dynamic> taskMap) {
    FirebaseFirestore.instance.doc(userId).collection("tasks").add(taskMap);
  }

  getTasks(String userId) async {
    return await FirebaseFirestore.instance.collection("tasks").snapshots();
  }

  deleteTask(String userId, String documentId) {
    FirebaseFirestore.instance
        .collection("tasks")
        .doc(documentId)
        .delete()
        .catchError((e) {
      print(e.toString());
    });
  }
}
