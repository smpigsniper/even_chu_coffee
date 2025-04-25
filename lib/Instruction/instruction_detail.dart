import 'package:flutter/material.dart';
import '../models/instruction.dart';

class InstructionDetail extends StatelessWidget {
  final Instruction instruction;

  const InstructionDetail({super.key, required this.instruction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(instruction.product)),
      body: ListView.builder(
        itemCount: instruction.steps.length,
        itemBuilder: (context, index) {
          final step = instruction.steps[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Step: ${step.step}"),
                Text("Time: ${step.time}"),
                Text("BeanTemp: ${step.beanTemp}"),
                Text("Heat: ${step.heat}"),
                Text("Fan: ${step.fan}"),
                Text("Info: ${step.info}"),
                if (step.memo.isNotEmpty) Text("Memo: ${step.memo}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
