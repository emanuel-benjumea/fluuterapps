class MealDetail {
  final String id;
  final String name;
  final String thumb;
  final String instructions;

  MealDetail({
    required this.id,
    required this.name,
    required this.thumb,
    required this.instructions,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    return MealDetail(
      id: json['idMeal'],
      name: json['strMeal'],
      thumb: json['strMealThumb'],
      instructions: json['strInstructions'],
    );
  }
}
