enum OperationType {
  insert,
  update,
  select,
}

abstract class DBRequest<R> {
  String tableName;

  Map<String, dynamic> _inputMap = {};
  OperationType _type = OperationType.select;
  String? _condition;
  List<dynamic>? _conditionArgs;

  DBRequest(this.tableName, {inputMap, type, condition, conditionArgs}) {
    if (inputMap != null) {
      _inputMap = inputMap;
    }

    if (type != null) {
      _type = type;
    }

    if (condition != null) {
      _condition = condition;
    }

    if (conditionArgs != null) {
      _conditionArgs = conditionArgs;
    }
  }

  Map<String, dynamic> getInputMap() {
    return _inputMap;
  }

  OperationType getOperationType() {
    return _type;
  }

  String? getCondition() {
    return _condition;
  }

  List<dynamic>? getConditionArgs() {
    return _conditionArgs;
  }

  R? deserializeObject(response);

  String getCreateTableQuery();
}
