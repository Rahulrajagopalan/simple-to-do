import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_todo_app/models/todo_model.dart';
import 'package:simple_todo_app/models/user_model.dart';

class DataServices {
  var userCollection = FirebaseFirestore.instance.collection("Users");
  // Create user collection
  Future storeUser(String id, UserModel user) async {
    await userCollection.doc(id).set(user.toMap());
  }
  // Get User as Stream
  Stream<List<UserModel>> getUserStream() {
    return userCollection.snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();
    });
  }

  // *************************** Todo ******************************
  // Create todos
  Future createTodo(String id, String todoId, TodoModel todoData) async {
    await userCollection.doc(id).collection("TODO").doc(todoId).set(todoData.toMap());
  }
  // Get Todo as Stream
  Stream<List<TodoModel>> getToDoStream(String id) {
    return userCollection.doc(id).collection("TODO").snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TodoModel.fromMap(doc.data());
      }).toList();
    });
  }
  // Update todos
  Future updateTodo(String id, String todoId, TodoModel todoData) async {
    await userCollection.doc(id).collection("TODO").doc(todoId).update(todoData.toMap());
  }
  // Remove todos
  Future removeTodo(String id, String todoId) async {
    await userCollection.doc(id).collection("TODO").doc(todoId).delete();
  }
}
