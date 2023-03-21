import 'package:algorithms_visualiser/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:algorithms_visualiser/models/search_model.dart';

abstract class SearchProvider extends BaseProvider {
  final List<SearchModel> numbers = [
    SearchModel(1),
    SearchModel(2),
    SearchModel(5),
    SearchModel(10),
    SearchModel(19),
    SearchModel(25),
    SearchModel(34),
    SearchModel(35),
    SearchModel(38),
    SearchModel(39),
    SearchModel(44),
    SearchModel(48),
    SearchModel(50),
    SearchModel(56),
    SearchModel(57),
    SearchModel(62),
    SearchModel(69),
    SearchModel(74),
    SearchModel(79),
    SearchModel(82),
    SearchModel(86),
    SearchModel(91),
    SearchModel(96),
    SearchModel(100)
  ];

  bool _isSearching = false;
  int _position = -2;

  bool get isSearching => _isSearching;
  int get position => _position;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
  }

  @protected
  void reset() {
    _isSearching = false;
    _position = -2;
    for (var number in numbers) {
      number.reset();
    }
    notifyListeners();
  }

  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    notifyListeners();
  }

  @protected
  void searchedNode(int index) {
    numbers[index].searched();
    notifyListeners();
  }

  @protected
  void discardNode(int index) {
    numbers[index].discard();
    notifyListeners();
  }

  @protected
  void discardNodes(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].discard();
    }
    notifyListeners();
  }

  @protected
  void foundNode(int index) {
    _isSearching = false;
    numbers[index].found();
    _position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    _position = -1;
    notifyListeners();
  }
}
