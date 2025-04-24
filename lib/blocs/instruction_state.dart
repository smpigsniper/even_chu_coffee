import '../models/instruction.dart';

abstract class InstructionState {}

class InstructionInitial extends InstructionState {}

class InstructionLoading extends InstructionState {}

class InstructionLoaded extends InstructionState {
  final List<Instruction> instructions;
  InstructionLoaded(this.instructions);
}

class InstructionError extends InstructionState {
  final String message;
  InstructionError(this.message);
}