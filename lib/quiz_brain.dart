import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

class QuizBrain {
  int _index = 0;

  List _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  get currentQuestionNumber => _index + 1;

  String get currentQuestionText => _questions[_index].text;

  get answers => _questions
      .map((q) => !q.answered
          ? Icon(
              Icons.adjust,
              color: Colors.white,
            )
          : q.answer == q.givenAnswer
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Icon(
                  Icons.close,
                  color: Colors.red,
                ))
      .toList();

  bool answer(bool answer) {
    _questions[_index].givenAnswer = answer;
    _questions[_index].answered = true;
    if (_index >= _questions.length - 1) {
      return false;
    }
    _index++;
    return true;
  }

  void reset() {
    _index = 0;
    _questions.forEach((element) {
      element.answered = false;
    });
  }
}
