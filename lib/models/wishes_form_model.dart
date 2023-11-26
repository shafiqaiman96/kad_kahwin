class WishesFormModel {
  String name, wish, dateTime;
  WishesFormModel({
    required this.name,
    required this.wish,
    required this.dateTime,
  });

  factory WishesFormModel.fromJson(Map<String, dynamic> json) =>
      WishesFormModel(
        name: json['name'],
        wish: json['wish'],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() =>
      {'name': name, 'wish': wish, 'dateTime': dateTime};
}
