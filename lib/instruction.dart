import 'package:even_chu_coffee/blocs/instruction_event.dart';
import 'package:even_chu_coffee/blocs/instruction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/instruction_bloc.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instructions')),
      body: BlocBuilder<InstructionBloc, InstructionState>(
        builder: (context, state) {
          if (state is InstructionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InstructionLoaded) {
            return ListView.builder(
              itemCount: state.instructions.length,
              itemBuilder: (context, index) {
                final instruction = state.instructions[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(instruction.product),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Step: ${instruction.step}"),
                        Text("BeanTemp: ${instruction.beanTemp}"),
                        Text("Fan: ${instruction.fan}"),
                        Text("Heat: ${instruction.heat}"),
                        Text("Info: ${instruction.info}"),
                        Text("Time: ${instruction.time}"),
                        if (instruction.memo.isNotEmpty)
                          Text("Memo: ${instruction.memo}"),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is InstructionError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Press the button to load data.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<InstructionBloc>().add(LoadInstructions());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
