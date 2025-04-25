import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/instruction.dart';

class InstructionRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Instruction>> fetchInstructions() async {
    final snapshot = await _firestore.collection('Instruction').get();

    return snapshot.docs.map((doc) {
      return Instruction.fromFirestore(doc.id, doc.data());
    }).toList();
  }
}
