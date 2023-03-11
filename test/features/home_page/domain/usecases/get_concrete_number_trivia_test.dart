import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xmanager/features/home_page/domain/entities/number_trivia.dart';
import 'package:xmanager/features/home_page/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/features/home_page/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecases;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecases = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tnumber = 1;
  final tNumberTrivia = NumberTrivia(text: "test", number: 1);
  
  test('should get trivia from repository', () async {

    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

  },);
}