class TodoModel {
  String taskName;
  String lastDate;
  String priority;
  String description;
  String todoId;
  TodoModel({
    required this.taskName,
    required this.lastDate,
    required this.priority,
    required this.description,
    required this.todoId,
  });
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        taskName: map["taskName"],
        lastDate: map["lastDate"],
        priority: map["priority"],
        description: map["description"],
        todoId: map["todoId"],);
  }
  Map<String, dynamic> toMap() {
    return {
      "taskName": taskName,
      "lastDate": lastDate,
      "priority": priority,
      "description": description,
      "todoId": todoId,
    };
  }
}
