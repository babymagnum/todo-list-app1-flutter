// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStores on HomeStoresBase, Store {
  final _$isLoadingAtom = Atom(name: 'HomeStoresBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

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

  final _$HomeStoresBaseActionController =
      ActionController(name: 'HomeStoresBase');

  @override
  dynamic populateListTask() {
    final _$actionInfo = _$HomeStoresBaseActionController.startAction();
    try {
      return super.populateListTask();
    } finally {
      _$HomeStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCheck(int index, bool value) {
    final _$actionInfo = _$HomeStoresBaseActionController.startAction();
    try {
      return super.changeCheck(index, value);
    } finally {
      _$HomeStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNotify(int index, bool value) {
    final _$actionInfo = _$HomeStoresBaseActionController.startAction();
    try {
      return super.changeNotify(index, value);
    } finally {
      _$HomeStoresBaseActionController.endAction(_$actionInfo);
    }
  }
}
