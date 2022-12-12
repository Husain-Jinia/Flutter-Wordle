import 'package:flutter/material.dart';
import 'package:wordlr_mmultiplayer/screens/single_player_game_screen.dart';
import 'package:wordlr_mmultiplayer/sharedPrefs.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  SharedPreferencesService prefs = SharedPreferencesService();
  int score=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    highScore();
  }

  highScore() async {
    int? highScore = await prefs.getScoreFromSharedPref('high-score');
    int ConvertedHighScore = highScore??=0.toInt();
    setState(() {
      score  = ConvertedHighScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text("Wordle"),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("High Score : $score"),
            Text("WORDLE", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.blue[200]),),
            SizedBox(height: 15,),
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
              child: const Text("Start game")
            ))
          ],
        ),
      ),
    );
  }
}