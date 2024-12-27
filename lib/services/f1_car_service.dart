import 'package:cloud_firestore/cloud_firestore.dart';

class F1CarService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch the list of F1 cars
  Future<List<Map<String, dynamic>>> getF1Cars() async {
    QuerySnapshot querySnapshot = await _firestore.collection('f1_cars_ferrari').get();

    // Convert documents to a list of maps
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
