import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/features/home_page/data/models/number_trivia_model.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(text: "test", number: 1);

  test("some test", () async {
    expect(tNumberTriviaModel, isA<NumberTriviaModel>());
  });
}