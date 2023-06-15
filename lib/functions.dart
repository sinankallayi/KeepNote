import 'package:cloud_firestore/cloud_firestore.dart';

void deleteData(id) {
  FirebaseFirestore.instance.collection('Entries').doc(id).delete().then(
        // ignore: avoid_print
        (doc) => print("Document deleted"),
        // ignore: avoid_print
        onError: (e) => print("Error updating document $e"),
      );
}
