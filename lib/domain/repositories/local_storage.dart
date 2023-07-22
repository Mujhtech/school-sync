import 'dart:async';

abstract class StringLocalStorage {
  FutureOr<String?> get();

  FutureOr<void> set(String value);
}

abstract class IntLocalStorage {
  FutureOr<int?> get();

  FutureOr<void> set(int value);
}

abstract class BoolLocalStorage {
  FutureOr<bool?> get();

  FutureOr<void> set(bool value);
}
