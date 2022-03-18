import 'package:survey_kit/survey_kit.dart';

Future<Task> getDepressionAnalysisTask() {
  var task = NavigableTask(
    id: TaskIdentifier(),
    steps: [
      InstructionStep(
        title: 'Welcome to the AIteen\'s mental health Survey',
        text:
            'This survey wants to access your mental health, and recommend some songs for you.',
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
          TextChoice(text: 'Home with family', value: 'Home with family'),
          TextChoice(text: 'Dorm', value: 'Dorm'),
          TextChoice(text: 'Homestay', value: 'Homestay'),
          TextChoice(text: 'Alone', value: 'Alone'),
        ]),
      ),
      QuestionStep(
        title:
            '2) Recently, how many hours did you sleep each day in a week, on average?',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(text: '3 hours or less', value: '3 hours or less'),
          TextChoice(
              text: 'More than 3 hours and less than 5 hours',
              value: 'More than 3 hours and less than 5 hours'),
          TextChoice(
              text: 'More than 5 hours and less than 7 hours',
              value: 'More than 5 hours and less than 7 hours'),
          TextChoice(
              text: 'More than 7 hours and less than 9 hours',
              value: 'More than 7 hours less than 9 hours'),
          TextChoice(text: '9 hours or more', value: '9 hours or more'),
        ]),
      ),
      QuestionStep(
        title:
            '3) Recently, I go to bed and wake up around the same time every school day (1 - Completely disagree to 5 - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '4) I tend to have good energy levels (1 - Completely disagree to 5 - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '5) Recently, I have had a loss of appetite ( 1 - Completely disagree to 5 - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '6) I tend to eat reasonably healthy foods (1 - Completely disagree to 5 - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '7) Recently, I have eaten more unhealthy food than usual (1 - Completely disagree to 5 - Completely agree,)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title: '8) How long have you been exercising a week?',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(text: "I don't exercise", value: "I don't exercise"),
          TextChoice(text: '< 30 minutes', value: '< 30 minutes'),
          TextChoice(
              text: 'Between 30 minutes and 1 hour',
              value: 'Between 30 minutes and 1 hour'),
          TextChoice(
              text: 'More than 1 hour and less than 3 hours',
              value: 'More than 1 hour and less than 3 hours'),
          TextChoice(
              text: 'More than 3 hours and less than 6 hours',
              value: 'More 3 hours and less than 6 hours'),
          TextChoice(text: 'More than 6 hours', value: 'More than 6 hours'),
        ]),
      ),
      QuestionStep(
        title:
            '9) Recently, I have exercised less than normal (1 - Completely disagree to 5  - Completely agree, 3 is no change)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '10) Recently, I feel more fatigued (tired) than normal (1 - Completely disagree to 5  - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '11) I tend to have reasonably good concentration (1 - Completely disagree to 5  - Completely agree)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '12) Recently, I have struggled to concentrate (1 - Completely disagree to 5  - Completely agree, 3 is neutral)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '13) I tend to have reasonable self-esteem (i.e. confidence in my own abilities/worth) (1 - Completely disagree to 5  - Completely agree)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '14) Recently, my self-esteem has been lower than normal (1 - Completely disagree to 5  - Completely agree,)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '15)  I tend to have good relationships with my family/friends (1 - Completely disagree to 5  - Completely agree)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '16) Recently, I have been having friendship/relationship problems (1 - Completely disagree to 5  - Completely agree)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      QuestionStep(
        title:
            '17) Which of the following is likely to cause you to feel stressed? (tick all that apply)',
        answerFormat: MultipleChoiceAnswerFormat(textChoices: [
          TextChoice(
              text: 'Relationship with friends',
              value: 'Relationship with friends'),
          TextChoice(
              text: 'Relationship with family',
              value: 'Relationship with family'),
          TextChoice(
              text: 'Relationship with teachers',
              value: 'Relationship with teachers'),
          TextChoice(text: 'Exam Prep/Result', value: 'Exam Prep / Result'),
          TextChoice(
              text: 'Thoughts about my future',
              value: 'Thoughts about my future'),
          TextChoice(text: 'Health', value: 'Health'),
          TextChoice(text: 'Repeating schedules', value: 'Repeating schedules'),
          TextChoice(text: 'Homesickness', value: 'Homesickness'),
          TextChoice(text: 'Physical appearance', value: 'Physical appearance'),
        ]),
      ),
      QuestionStep(
        title: '18) Do you have any ways to release stress? (e.g. meditation)',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(
              text: 'Yes, but I have not been able to do so recently',
              value: 'Yes, but I have not been able to do so recently.'),
          TextChoice(
              text: 'No, I do not have one.', value: 'No, I do not have one.'),
        ]),
      ),
      QuestionStep(
        title:
            '19) Do you have someone you can talk to about personal thoughts?',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
          TextChoice(text: 'Not anymore', value: 'Not anymore'),
        ]),
      ),
      QuestionStep(
        title:
            '20) Do you think you spent sufficient time with your family over the last few weeks? (Virtual meetings also)',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription:
              'I spent too much / too little time with my family',
          maximumValueDescription: 'I spent sufficient time with my family',
        ),
      ),
      QuestionStep(
        title:
            '21) Recently, how often do you meet with other people for purposes aside from school?',
        answerFormat: SingleChoiceAnswerFormat(textChoices: [
          TextChoice(
              text: 'More than once a week', value: 'More than once a week'),
          TextChoice(text: '1~3 times a month', value: '1~3 times a month'),
          TextChoice(text: 'Rarely', value: 'Rarely'),
        ]),
      ),
      QuestionStep(
        title: '22) Recently, how satisfied have you been with your lifestyle?',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'I was always miserable this month',
          maximumValueDescription:
              'I was extremely energetic and enthusiastic this month',
        ),
      ),
      QuestionStep(
        title:
            '23) To what extent do you think that mental health care education should be considered seriously?',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'I am not interested in it',
          maximumValueDescription:
              'I am genuinely interested in health care education',
        ),
      ),
      QuestionStep(
        title: '24) I am able to cope with sudden stress.',
        answerFormat: ScaleAnswerFormat(
          step: 1,
          minimumValue: 1,
          maximumValue: 5,
          defaultValue: 3,
          minimumValueDescription: 'Completely disagree',
          maximumValueDescription: 'Completely agree',
        ),
      ),
      CompletionStep(
        stepIdentifier: StepIdentifier(id: '321'),
        text:
            'Thank you for completing our survey! Your results will come up when you press the "Submit survey" button.',
        title: 'Done!',
        buttonText: 'Submit survey',
      ),
    ],
  );
  // task.addNavigationRule(
  //   forTriggerStepIdentifier: task.steps[6].stepIdentifier,
  //   navigationRule: ConditionalNavigationRule(
  //     resultToStepIdentifierMapper: (input) {
  //       switch (input) {
  //         case "Yes":
  //           return task.steps[0].stepIdentifier;
  //         case "No":
  //           return task.steps[7].stepIdentifier;
  //         default:
  //           return null;
  //       }
  //     },
  //   ),
  // );
  return Future.value(task);
}
