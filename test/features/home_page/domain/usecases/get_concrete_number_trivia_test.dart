import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xmanager/features/home_page/domain/entities/number_trivia.dart';
import 'package:xmanager/features/home_page/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmanager/features/home_page/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  MockNumberTriviaRepository mockNumberTriviaRepository;
  GetConcreteNumberTrivia usecase;

  setUp((){
    //mockNumberTriviaRepository = MockNumberTriviaRepository();
    //usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "test", number: 1);
  
  test('should get trivia from repositories', () async {


    // Arrange
    final getnumber = MockNumberTriviaRepository().getConcreteNumberTrivia(2);

    /*
    when(getnumber as Function()).thenAnswer((_) async => Right(tNumberTrivia));

    // Act
    final result = await usecase(Params(number: tNumber));

    // Assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber) as Function());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
    */
  },);
}