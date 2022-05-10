class Data_model
{
  String id,user,title,body;

  Data_model(this.id, this.user, this.title, this.body);

  factory Data_model.fromJson(Map<String, dynamic> json) {
    return Data_model(
       json['id'],
       json['userId'],
       json['title'],
       json['body'],
    );
  }

}