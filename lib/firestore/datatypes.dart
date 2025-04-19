class CharacterData {
  String subclass;
  double score;
  String review;

  CharacterData({
    required this.subclass,
    required this.score,
    required this.review,
  });

  // Convert a CharacterData object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'subclass': subclass,
      'score': score,
      'review': review,
    };
  }

  // Create a CharacterData object from a JSON map
  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      subclass: json['subclass'] ?? '',
      score: (json['score'] ?? 0.0).toDouble(),
      review: json['review'] ?? '',
    );
  }
}
