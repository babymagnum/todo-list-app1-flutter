// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStores on HomeStoresBase, Store {
  final _$listTaskAtom = Atom(name: 'HomeStoresBase.listTask');

  @override
  List<TaskModel> get listTask {
    _$listTaskAtom.context.enforceReadPolicy(_$listTaskAtom);
    _$listTaskAtom.reportObserved();
    return super.listTask;
  }

  @override
  set listTask(List<TaskModel> value) {
    _$listTaskAtom.context.conditionallyRunInAction(() {
      super.listTask = value;
      _$listTaskAtom.reportChanged();
    }, _$listTaskAtom, name: '${_$listTaskAtom.name}_set');
  }
}
