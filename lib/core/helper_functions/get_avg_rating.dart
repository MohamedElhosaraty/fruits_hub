import 'package:fruits_hub/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  var sun = 0.0;
  for (var review in reviews) {
    sun += review.ratting;
  }
  return sun / reviews.length;
}