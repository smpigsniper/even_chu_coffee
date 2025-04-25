import 'package:even_chu_coffee/Instruction/instruction_detail.dart';
import 'package:even_chu_coffee/blocs/instruction_event.dart';
import 'package:even_chu_coffee/blocs/instruction_state.dart';
import 'package:even_chu_coffee/models/instruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/instruction_bloc.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InstructionBloc>().add(LoadInstructions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instructions')),
      body: BlocBuilder<InstructionBloc, InstructionState>(
        builder: (context, state) {
          if (state is InstructionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InstructionLoaded) {
            return _productList(state);
          } else if (state is InstructionError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }

  Widget _productList(InstructionLoaded state) {
    return ListView.builder(
      itemCount: state.instructions.length,
      itemBuilder: (context, index) {
        final instruction = state.instructions[index];
        return InkWell(
          onTap: () {
            _instructionDetail(instruction);
          },
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                instruction.product,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _instructionDetail(Instruction instruction) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InstructionDetail(instruction: instruction),
      ),
    );
  }
}
