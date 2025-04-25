import 'package:even_chu_coffee/models/instruction.dart';
import 'package:flutter/material.dart';

class InstructionDetail extends StatefulWidget {
  final Instruction instruction;
  const InstructionDetail({super.key, required this.instruction});

  @override
  State<InstructionDetail> createState() => _InstructionDetailState();
}

class _InstructionDetailState extends State<InstructionDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.instruction.product)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow("Step", widget.instruction.step.toString()),
                _detailRow("Bean Temp", widget.instruction.beanTemp),
                _detailRow("Fan", widget.instruction.fan),
                _detailRow("Heat", widget.instruction.heat),
                _detailRow("Info", widget.instruction.info),
                _detailRow("Time", widget.instruction.time),
                if (widget.instruction.memo.isNotEmpty)
                  _detailRow("Memo", widget.instruction.memo),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
