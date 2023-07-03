
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/quiz/question_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  final String quizID;
  final String quizName;
  const QuizScreen({super.key,required this.quizID,required this.quizName});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  //List<Question> questionList = getQuestions();
  List<QuestionModel> questionList = [];
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool isfetching=true;
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 0);


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuizQuestion();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countdownTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAEFE8),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            widget.quizName,
            style: TextStyle(
                fontSize: 20,
                color: ColorManager.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      body: isfetching?Center(child: Text("Loading"),):questionList.isNotEmpty?Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                     // _countDownTimer(),
                      _questionWidget(),
                      SizedBox(height: 50,),
                      _answerList(),
                      SizedBox(height: 50,),
                      _nextButton(),
                      SizedBox(height: 50,),
                    ]),
            ),
      ):SizedBox(),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            questionList[currentQuestionIndex].seconds != null? _countDownTimer():SizedBox(),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].name??"",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children:questionList[currentQuestionIndex].answers!=null?questionList[currentQuestionIndex].answers!.isNotEmpty?_getAnswers(questionList[currentQuestionIndex].answers!.keys):[]:[]
    );
  }

  Widget _answerButton(String answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.blueAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          setState(() {
              selectedAnswer = answer;
            });
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(
          isLastQuestion ? "Submit" : "Next",
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed:()=> _nextFunction(),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      //pass if 60 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        title + " | Score is $score",
        style: TextStyle(color: isPassed ? Colors.blueAccent : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () async{
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
          resetTimer(questionList[currentQuestionIndex].seconds);
          startTimer(questionList[currentQuestionIndex].seconds);
        },
      ),
    );
  }
  
  List<Widget> _getAnswers(Iterable<String> asnwers) {
    List<Widget> answersBtns = [];
    if(questionList[currentQuestionIndex].answers!=null){
        if(questionList[currentQuestionIndex].answers!.isNotEmpty){
          for (String book in asnwers){
            answersBtns.add(_answerButton(book));
          }
        }
      }
      return answersBtns;
  }
  
  void getQuizQuestion() async{
    try{
          setState(() {
      isfetching = true;
    });
    List<QuestionModel> _questionList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('questions')
          .where("quizID", isEqualTo: widget.quizID).get();
    querySnapshot.docs.forEach((element) {
      _questionList.add(QuestionModel.fromFirestore(element));
    });
    print("_questionList ============== " + _questionList.length.toString());
    setState(() {
      questionList = _questionList;
      isfetching = false;
    });
    startTimer(questionList[0].seconds);
    }catch(e){
      print("_questionList ============== EEErrrooorrr");
      setState(() {
      questionList = [];
      isfetching = false;
    });

    }
  }
  
  Widget _countDownTimer() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: Column(
            children: [
              Text(
                '$hours:$minutes:$seconds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ],
          ),
        ),
    );
  }
  void startTimer(int? val) {
    if(val != null){
      setState(() {
        myDuration = Duration(seconds: val);
      });
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    }

  }
  // Step 4
  void stopTimer() {
      setState(() => countdownTimer?.cancel());
  }
  // Step 5
  void resetTimer(int? val) {
    if(val !=null){
      stopTimer();
    setState(() => myDuration = Duration(seconds:val));
    }
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer?.cancel();
        _nextFunction();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  
  _nextFunction() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    if(selectedAnswer != null){
            if(questionList[currentQuestionIndex].answers![selectedAnswer]==true){
            setState(() {
              score++;
            });
            }
          }
          if (isLastQuestion) {
            //display score
            stopTimer();
            showDialog(context: context, barrierDismissible: false,builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
            resetTimer(questionList[currentQuestionIndex].seconds);
            startTimer(questionList[currentQuestionIndex].seconds);
          }
  }
  
}
