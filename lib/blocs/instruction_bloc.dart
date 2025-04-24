import 'package:bloc/bloc.dart';
import 'package:even_chu_coffee/blocs/instruction_event.dart';
import 'package:even_chu_coffee/blocs/instruction_state.dart';
import 'package:even_chu_coffee/repositories/instruction_repository.dart';

class InstructionBloc extends Bloc<InstructionEvent, InstructionState> {
  final InstructionRepository repository;

  InstructionBloc(this.repository) : super(InstructionInitial()) {
    on<LoadInstructions>((event, emit) async {
      emit(InstructionLoading());
      try {
        final data = await repository.fetchInstructions();
        emit(InstructionLoaded(data));
      } catch (e) {
        emit(InstructionError(e.toString()));
      }
    });
  }
}