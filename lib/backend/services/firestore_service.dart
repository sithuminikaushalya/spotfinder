import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all documents from a collection
  Stream<QuerySnapshot> getCollection(String path) {
    return _firestore.collection(path).snapshots();
  }

  // Add document to a collection
  Future<void> addDocument(String path, Map<String, dynamic> data) async {
    await _firestore.collection(path).add(data);
  }

  // Update document
  Future<void> updateDocument(
      String path, String id, Map<String, dynamic> data) async {
    await _firestore.collection(path).doc(id).update(data);
  }

  // Delete document
  Future<void> deleteDocument(String path, String id) async {
    await _firestore.collection(path).doc(id).delete();
  }
}
