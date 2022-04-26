import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bjj_guide/models/comment.dart';
import 'package:bjj_guide/models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Map<String, User> userMap = <String, User>{};

  final StreamController<Map<String, User>> _usersController =
      StreamController<Map<String, User>>();

  final StreamController<List<Comment>> _commentsController =
      StreamController<List<Comment>>();

  DatabaseService() {
    _firestore.collection('users').snapshots().listen(_usersUpdated);
    _firestore.collection('comments').snapshots().listen(_commentsUpdated);
  }

  Stream<Map<String, User>> get users => _usersController.stream;
  Stream<List<Comment>> get comments => _commentsController.stream;

  void _usersUpdated(QuerySnapshot<Map<String, dynamic>> snapshot) {
    var users = _getUsersFromSnapshot(snapshot);
    _usersController.add(users);
  }

  void _commentsUpdated(QuerySnapshot<Map<String, dynamic>> snapshot) {
    var comments = _getCommentsFromSnapshot(snapshot);
    _commentsController.add(comments);
  }

  Map<String, User> _getUsersFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    for (var element in snapshot.docs) {
      User user = User.fromMap(element.id, element.data());
      userMap[user.id] = user;
    }

    return userMap;
  }

  List<Comment> _getCommentsFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    List<Comment> comments = [];
    for (var element in snapshot.docs) {
      Comment comment = Comment.fromMap(element.id, element.data());
      comments.add(comment);
    }
    comments.sort((a, b) => a.created.compareTo(b.created));
    return comments;
  }

  Future<User> getUser(String uid) async {
    var snapshot = await _firestore.collection("users").doc(uid).get();

    return User.fromMap(snapshot.id, snapshot.data()!);
  }

  Future<void> setUser(String uid, String displayName, String email) async {
    await _firestore.collection("users").doc(uid).set({
      "name": displayName,
      "type": "USER",
      "email": email,
      "created": DateTime.now()
    });
    return;
  }

  Future<void> addComment(String uid, String message, String page) async {
    await _firestore.collection("comments").add({
      'message': message,
      'from': uid,
      'page': page,
      "created": DateTime.now()
    });
    return;
  }
}