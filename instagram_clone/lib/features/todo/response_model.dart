import 'dart:convert';

List<TodoResponseApi> todoResponseApiFromJson(String str) => List<TodoResponseApi>.from(json.decode(str).map((x) => TodoResponseApi.fromJson(x)));

String todoResponseApiToJson(List<TodoResponseApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoResponseApi {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    TodoResponseApi({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory TodoResponseApi.fromJson(Map<String, dynamic> json) => TodoResponseApi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
