import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  Comment(
      {required this.id,
      required this.from,
      required this.page,
      required this.comment,
      required this.created
      
    });

  factory Comment.fromMap(String id, Map<String, dynamic> data) {
    return Comment(
      id: id,
      from: data['from'],
      page: data['page'],
      comment: data['comment'],
      created: data['created']
    );
  }
  Map<String, dynamic> toJson() => {
        'from': from,
        'page': page,
        'comment': comment,
        'created': created
      };

  final String id;
  final String from;
  final String page;
  final String comment;
  final Timestamp created;
}