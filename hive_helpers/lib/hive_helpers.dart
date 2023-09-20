library hive_helpers;

import 'package:hive_flutter/hive_flutter.dart';

mixin HiveObjectProviderMixin<T extends HiveObjectMixin>  {
  
  Box<T>? get box;

  int get length => box?.length ?? 0;
  bool get isEmpty => length == 0;

  Future<void> add(T obj) async {
    await box?.add(obj);
  }
  Future<void> addAll(Iterable<T> objs) async {
    await box?.addAll(objs);
  }

  Iterable<T> get all => box?.values.toList() ?? <T>[];

  T? at(int index) => box?.getAt(index);

  Future<void> remove(T obj) => obj.delete();
  Future<void> removeAll(Iterable<T> objs) async {
    for (var obj in objs) {
      await obj.delete();
    }
  }
  Future<void> reset() async {
    await box?.clear();
  }

  Future<void> close() async {
    await box?.compact();
    await box?.close();
  }

}

mixin NonHiveObjectProviderMixin<T>  {
  Box<T>? get box;

  int get length => box?.length ?? 0;
  bool get isEmpty => length == 0;

  Future<void> add(T obj) async {
    await box?.add(obj);
  }
  Future<void> addByKey(dynamic key, T object) async {
    await box?.put(key, object);
  }
  Future<void> addAll(Iterable<T> objs) async {
    await box?.addAll(objs);
  }
  Future<void> addAllByKey(Map<dynamic, T> items) async {
    for (var key in items.keys) {
      await addByKey(key, items[key]!);
    }
  }

  Iterable<T> get all => box?.values.toList() ?? <T>[];

  T? at(int index) => box?.getAt(index);

  Future<void> remove(int index) async {
    await box?.deleteAt(index);
  }
  Future<void> removeByKey(dynamic key) async {
    await box?.delete(key);
  }
  Future<void> reset() async {
    await box?.clear();
  }

  Future<void> close() async {
    await box?.compact();
    await box?.close();
  }

}

