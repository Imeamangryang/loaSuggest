import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create or update a document with JSON data
  Future<void> setData({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> jsonData,
  }) async {
    try {
      await _firestore
          .collection(collectionPath)
          .doc(documentId)
          .set(jsonData, SetOptions(merge: true));
    } catch (e) {
      print('Error setting data: $e');
    }
  }

  // Update specific fields in a document with JSON data
  Future<void> updateData({
    required String collectionPath,
    required String documentId,
    required Map<String, dynamic> jsonData,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update(jsonData);
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  // Read a document and return JSON data
  Future<Map<String, dynamic>?> getData({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      final doc = await _firestore.collection(collectionPath).doc(documentId).get();
      if (doc.exists) {
        return doc.data();
      }
    } catch (e) {
      print('Error getting data: $e');
    }
    return null;
  }

  // Delete a document
  Future<void> deleteData({
    required String collectionPath,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).delete();
    } catch (e) {
      print('Error deleting data: $e');
    }
  }

  // Listen to a collection and return a stream of JSON data
  Stream<List<Map<String, dynamic>>> collectionStream({
    required String collectionPath,
  }) {
    return _firestore.collection(collectionPath).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  // Listen to a single document and return a stream of JSON data
  Stream<Map<String, dynamic>?> documentStream({
    required String collectionPath,
    required String documentId,
  }) {
    return _firestore.collection(collectionPath).doc(documentId).snapshots().map((doc) {
      if (doc.exists) {
        return doc.data();
      }
      return null;
    });
  }
}
