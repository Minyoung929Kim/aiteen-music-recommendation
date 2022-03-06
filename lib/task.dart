import 'package:survey_kit/survey_kit.dart';

Future<Task> getDepressionAnalysisTask() {
  var task = NavigableTask(
    id: TaskIdentifier(),
    steps: [
      InstructionStep(
        title: 'Welcome to AI Team\'s mental health survey!',
        text:
            'This survey wants to assess your mental health, and recommend some songs for you.',
        buttonText: 'Take the survey',
      ),
      QuestionStep(
        title: 'Grade',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(text: 'GR06', value: 'GR06'),
          TextChoice(text: 'GR07', value: 'GR07'),
          TextChoice(text: 'GR08', value: 'GR08'),
          TextChoice(text: 'GR09', value: 'GR09'),
          TextChoice(text: 'GR10', value: 'GR10'),
          TextChoice(text: 'GR11', value: 'GR11'),
          TextChoice(text: 'GR12', value: 'GR12'),
        ]),
      ),
      QuestionStep(
          title: '1) Where do you live during the semester? Please select all.',
          answerFormat: MultipleChoiceAnswerFormat(textChoices: [
            TextChoice(text: 'Dorm', value: 'Dorm'),
            TextChoice(text: 'Home', value: 'Home'),
            TextChoice(text: 'Home Stay', value: 'Home Stay'),
          ])),
      QuestionStep(
          title:
              '2) Recently, how many hours did you sleep each day in a week, on average?',
          answerFormat: SingleChoiceAnswerFormat(textChoices: [
            TextChoice(text: '1~2 hours', value: '1~2 hours'), //etc
          ])),
      QuestionStep(
          title:
              '3) Recently, I go to bed and wake up around the same time every school day (1 - Completely disagree to 5  - Completely agree, 3 is neutral)',
          answerFormat: ScaleAnswerFormat(
            step: 1,
            minimumValue: 1,
            maximumValue: 5,
            defaultValue: 3,
            minimumValueDescription: 'Completely disagree',
            maximumValueDescription: 'Completely agree',
          )),
      CompletionStep(
        stepIdentifier: StepIdentifier(id: '321'),
        text: 'Thanks for taking the survey, we will contact you soon!',
        title: 'Done!',
        buttonText: 'Submit survey',
      ),
    ],
  );
  return Future.value(task);
}
