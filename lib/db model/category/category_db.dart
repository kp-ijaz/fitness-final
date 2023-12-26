import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homeworkout/db%20model/db_model.dart';
// import 'package:homeworkout/db/db_model.dart';

const CATEGORY_DB_NAME = "category_db";

abstract class CategoryDbFunctions {
  Future<void> addExercise(CategoryModel obj);
  Future<List<CategoryModel>> getAllExercise();
  Future<void> refreshUi();
  Future<void> deleteExercise(String id);
  Future<void> editExercise(String id);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

// ------------------category------------------------

  ValueNotifier<List<CategoryModel>> withoutListNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> gymListNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> yogaListNotifier = ValueNotifier([]);
// -----------------sub-category------------------------

  ValueNotifier<List<CategoryModel>> fullbodyListNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> lowerbodyListNotifier = ValueNotifier([]);

// -----------------level type------------------------

  ValueNotifier<List<CategoryModel>> beginnerListNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> intermediateListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> advancedListNotifier = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> allaboveListNotifier = ValueNotifier([]);

  @override
  Future<void> addExercise(CategoryModel obj) async {
    final _db = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _db.put(obj.id!, obj);

// ------------------category------------------------

    withoutListNotifier.value.clear();
    gymListNotifier.value.clear();
    yogaListNotifier.value.clear();
// -----------------sub-category------------------------

    fullbodyListNotifier.value.clear();
    lowerbodyListNotifier.value.clear();
// -----------------level type------------------------
    beginnerListNotifier.value.clear();
    intermediateListNotifier.value.clear();
    advancedListNotifier.value.clear();
    allaboveListNotifier.value.clear();

    await refreshUi();
  }

  @override
  Future<List<CategoryModel>> getAllExercise() async {
    final db = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return db.values.toList();
  }

  @override
  Future<void> refreshUi() async {
    final allData = await getAllExercise();
// -----------------category------------------------
    withoutListNotifier.value.clear();
    gymListNotifier.value.clear();
    yogaListNotifier.value.clear();
// -----------------sub-category------------------------
    fullbodyListNotifier.value.clear();
    lowerbodyListNotifier.value.clear();
// -----------------level type------------------------
    beginnerListNotifier.value.clear();
    intermediateListNotifier.value.clear();
    advancedListNotifier.value.clear();
    allaboveListNotifier.value.clear();

    Future.forEach(allData, (element) async {
      if (element.type == CategoryType.withoutEqupment) {
        withoutListNotifier.value.add(element);
        // print(withoutListNotifier.value[0].leveltype);
      } else if (element.type == CategoryType.gym) {
        gymListNotifier.value.add(element);
      } else {
        yogaListNotifier.value.add(element);
      }
      withoutListNotifier.notifyListeners();
      gymListNotifier.notifyListeners();
      yogaListNotifier.notifyListeners();
    });
// -----------------sub-category------------------------
    Future.forEach(allData, (element) async {
      if (element.subtype == SubCategoryType.fullbody) {
        fullbodyListNotifier.value.add(element);
      } else {
        lowerbodyListNotifier.value.add(element);
      }
      fullbodyListNotifier.notifyListeners();
      lowerbodyListNotifier.notifyListeners();
    });
// -----------------level type------------------------
    Future.forEach(allData, (element) async {
      if (element.leveltype == Typelevel.beginner) {
        beginnerListNotifier.value.add(element);
      } else if (element.leveltype == Typelevel.intermediate) {
        intermediateListNotifier.value.add(element);
      } else if (element.leveltype == Typelevel.advanced) {
        advancedListNotifier.value.add(element);
      } else {
        beginnerListNotifier.value.add(element);
        intermediateListNotifier.value.add(element);
        advancedListNotifier.value.add(element);
      }
      beginnerListNotifier.notifyListeners();
      intermediateListNotifier.notifyListeners();
      advancedListNotifier.notifyListeners();
      allaboveListNotifier.notifyListeners();
    });
// -----------------category------------------------
    withoutListNotifier.notifyListeners();
    gymListNotifier.notifyListeners();
    yogaListNotifier.notifyListeners();
// -----------------sub-category------------------------
    fullbodyListNotifier.notifyListeners();
    lowerbodyListNotifier.notifyListeners();
// -----------------level type------------------------

    beginnerListNotifier.notifyListeners();
    intermediateListNotifier.notifyListeners();
    advancedListNotifier.notifyListeners();
    allaboveListNotifier.notifyListeners();
  }

  @override
  Future<void> deleteExercise(String id) async {
    final _db = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _db.delete(id);
    await refreshUi();
  }

  @override
  Future<void> editExercise(String id) async {}
}
