class News{
  String name;
  String street;

  News(this.name,this.street);

  News.fromJson(Map<String,dynamic> json){
    name=json['name'];
   street=json["address"]['street'];
  }
}