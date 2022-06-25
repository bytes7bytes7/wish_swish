const _duration = Duration(seconds: 2);

abstract class CounterRepo {
  const CounterRepo();

  Future<int> increment(int value);

  Future<int> decrement(int value);
}

class CounterRepoImpl implements CounterRepo {
  const CounterRepoImpl();

  @override
  Future<int> increment(int value) async {
    return Future.delayed(_duration, () => value + 1);
  }

  @override
  Future<int> decrement(int value) async {
    return Future.delayed(_duration, () => value - 1);
  }
}
