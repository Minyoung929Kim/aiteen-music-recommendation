import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey_kit/survey_kit.dart';
import 'package:survey/task.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<http.Response> getRecommendation(String survey) async {
  return http.post(
    Uri.parse("https://aiteen-music-recommendation.herokuapp.com/predict"),
    headers: {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    },
    body: jsonEncode({"survey": survey}),
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> questions = [];
  String sample_entry = '';

  Future<List<String>> loadQuestions() async {
    List<String> _questions = [];
    await rootBundle.loadString('assets/question.txt').then((q) {
      for (String i in const LineSplitter().convert(q)) {
        _questions.add(i);
      }
    });
    return _questions;
  }

  Future<String> loadSample() async {
    final sample_json =
        await rootBundle.loadString('assets/example_entry.json');
    return json.decode(sample_json);
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

  _setup() async {
    // Retrieve the questions (Processed in the background)
    List<String> _questions = await loadQuestions();
    String sample = await loadSample();

    // Notify the UI and display the questions
    setState(() {
      questions = _questions;
      sample_entry = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<Task>(
              future: getDepressionAnalysisTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  final task = snapshot.data!;
                  return SurveyKit(
                    onResult: (SurveyResult result) async {
                      List answers = [];
                      if (result.finishReason == FinishReason.COMPLETED) {
                        for (var stepResult in result.results) {
                          for (var questionResult in stepResult.results) {
                            if (questionResult is SingleChoiceQuestionResult) {
                              answers.add(questionResult.result!.value);
                            } else if (questionResult
                                is MultipleChoiceQuestionResult) {
                              List choices = questionResult.result!
                                  .map((choice) => choice.value)
                                  .toList();
                              answers.add(choices.join(', '));
                            } else if (questionResult is ScaleQuestionResult) {
                              answers.add(questionResult.result);
                            }
                          }
                        }
                        Map qa_pair = {};
                        answers.asMap().forEach(
                            (index, ans) => qa_pair[questions[index]] = ans);
                        var encoded = json.encode(qa_pair);
                        var recommendation = await getRecommendation(encoded);
                        // print(recommendation.statusCode);
                        // print(recommendation.body);

                        // navigate to new page
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MusicScreen(
                                recommendation: recommendation.body)));
                      } else {
                        // not completed
                        inspect(result);
                      }
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'cancel': 'Cancel',
                      'next': 'Next',
                    },
                    themeData: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.cyan,
                      ).copyWith(
                        onPrimary: Colors.white,
                      ),
                      primaryColor: Colors.cyan,
                      backgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                        color: Colors.white,
                        iconTheme: IconThemeData(
                          color: Colors.cyan,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.cyan,
                        ),
                      ),
                      iconTheme: const IconThemeData(
                        color: Colors.cyan,
                      ),
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.cyan,
                        selectionColor: Colors.cyan,
                        selectionHandleColor: Colors.cyan,
                      ),
                      cupertinoOverrideTheme: CupertinoThemeData(
                        primaryColor: Colors.cyan,
                      ),
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(150.0, 60.0),
                          ),
                          side: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return BorderSide(
                                  color: Colors.grey,
                                );
                              }
                              return BorderSide(
                                color: Colors.cyan,
                              );
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: Colors.grey,
                                    );
                              }
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                    color: Colors.cyan,
                                  );
                            },
                          ),
                        ),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.cyan,
                                ),
                          ),
                        ),
                      ),
                      textTheme: TextTheme(
                        headline2: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                        headline5: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                        bodyText2: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        subtitle1: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MusicScreen extends StatelessWidget {
  MusicScreen({Key? key, required this.recommendation}) : super(key: key);
  String recommendation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recommended Music')),
      body: Center(
        child: Text(
          recommendation,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
