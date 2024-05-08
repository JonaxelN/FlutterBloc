import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(5);

  void incrementBy(int n) => emit(state + n);
}
