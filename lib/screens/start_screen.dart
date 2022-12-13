import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:wordlr_mmultiplayer/screens/single_player_game_screen.dart';
import 'package:wordlr_mmultiplayer/sharedPrefs.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  SharedPreferencesService prefs = SharedPreferencesService();
  int highScore = 0;
  int score= 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setHighScore();
    setScore();
  }

  setHighScore() async {
    int? hScore = await prefs.getScoreFromSharedPref('high-score');
    int ConvertedHighScore = hScore??=0.toInt();
    setState(() {
      highScore  = ConvertedHighScore;
    });
  }

  setScore()async{
    int? PrevScore = await prefs.getScoreFromSharedPref("score");
    setState(() {
      score = PrevScore??=0;
      print("hjk");
    });
  }

  rebootScoreAndLevel() async {
    await prefs.saveScoreToSharedPref("score", 0);
    await prefs.saveLevelToSharedPref('level', 1);
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      // appBar: AppBar(
      //   title: const Text("Wordle"),
      // ),
      body:
      Container(
        decoration:const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: GradientColors.winterNeva,
            )), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // Text("WORDLE", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.blue[200]),),
              Image.asset("assets/logo.png"),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[200]
                ),
                child: Column(children: [
                  Text("HIGH SCORE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue[500]),),
                  SizedBox(height: 15,),
                  Text("$highScore", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 55, color: Colors.blue[600]),),
                ]),
              ),
              SizedBox(height: 30,),
               SizedBox(
              width: 240,
              // height: double.infinity, 
              child:
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  primary: Colors.blue[400]
                ),
                onPressed: () {
                  rebootScoreAndLevel();
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SinglePlayer(),
                    ),
                  );
                }, 
                child: const Text("Start a new game")
              )),
              
              const SizedBox(height: 15,),
              score!=0?
              SizedBox(
              width: 240,
              // height: double.infinity, 
              child:
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  primary: Colors.blue[400]
                ),
                onPressed: (){
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SinglePlayer(),
                    ),
                  );
                }, 
                child: const Text("Continue game")
              )):Container()
            ],
          ),
        ),
      ),
    );
  }
}