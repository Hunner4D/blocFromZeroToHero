import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('the inital state of CounterCubit equals 0', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        'this bloc should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment is called',
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: [CounterState(counterValue: 1, wasIncremented: true)]);
  });
}
