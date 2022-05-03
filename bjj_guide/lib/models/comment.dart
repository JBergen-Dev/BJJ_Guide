import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  Comment(
      {required this.id,
      required this.comment,
      required this.created,
      required this.from,
      required this.page
    
      
    });

  factory Comment.fromMap(String id, Map<String, dynamic> data) {
    return Comment(
      id: id,
      comment: data['comment'],
      created: data['created'], 
      from: data['from'],
      page: data['page']
    );
  }
  Map<String, dynamic> toJson() => {
       'comment': comment,
       'created': created,
        'from': from,
        'page': page
      };

  final String id;
  final String comment;
  final Timestamp created;
  final String from;
  final String page;
 
}