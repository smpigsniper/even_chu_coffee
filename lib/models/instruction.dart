import 'package:even_chu_coffee/models/instruction_step.dart';

class Instruction {
  final String product;
  final List<InstructionStep> steps;

  Instruction({required this.product, required this.steps});

  factory Instruction.fromFirestore(String id, Map<String, dynamic> data) {
    final List<dynamic> stepsData = data['Steps'] ?? [];
    final steps = stepsData.map((e) => InstructionStep.fromMap(e)).toList();
    return Instruction(product: id, steps: steps);
  }
}
