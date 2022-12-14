import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:pinput/pinput.dart';
import 'package:wordlr_mmultiplayer/screens/start_screen.dart';
import 'package:wordlr_mmultiplayer/widgets/text_box_field.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_box.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_set.dart';
import 'package:wordlr_mmultiplayer/word_list.dart';
import "dart:math";

import '../sharedPrefs.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {

  List alphabets = ["a","b","c","d","e",'f',"g","h","i","j","k","l","m","n","o","p","q","r","s",'t',"u","v","w","x","y","z"];
  SharedPreferencesService prefs = SharedPreferencesService();
  int activeTileSet = 0;
  int tileCount = 0;
  List tileList1 = ["","","","",""];
  List tileList2 = ["","","","",""];
  List tileList3 = ["","","","",""];
  List tileList4 = ["","","","",""];
  List tileList5 = ["","","","",""];
  List tileList6 = ["","","","",""];
  List status1 = ["","","","",""];
  List status2 = ["","","","",""];
  List status3 = ["","","","",""];
  List status4 = ["","","","",""];
  List status5 = ["","","","",""];
  List status6 = ["","","","",""];

  int tileNumber = 0;
  int tileSet = 0;

  var tempWord = (words..shuffle()).first;

  int level = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLevel();
  }

  // score management logic
  score(String status) async {
    int currentLevelScore = (5 - activeTileSet);
    int? currentScore =await prefs.getScoreFromSharedPref('score');
    int totalScore;
    status!="over"?totalScore = currentLevelScore + currentScore!:totalScore = currentScore!;
    await prefs.saveScoreToSharedPref("score", totalScore);
    if(status == "over"){
      int? highScore =await prefs.getScoreFromSharedPref('high-score');
      int convertedHighScore = highScore??=0.toInt();
      totalScore>convertedHighScore? 
      await prefs.saveScoreToSharedPref("high-score", totalScore):
      await prefs.saveScoreToSharedPref("high-score", highScore);
      await prefs.saveScoreToSharedPref("score", 0);
    }
  }
  
  // logic for setting level when user enters the game after clicking continue
  setLevel() async {
    int? currentLevel = await prefs.getLevelFromSharedPref('level');
    setState(() {
      level = currentLevel??=1;
    });
  }

  // logic for updating the levels
  levelUpdate(status) async {
    int? currentLevel = await prefs.getLevelFromSharedPref('level');
    await prefs.saveLevelToSharedPref('level', currentLevel!.toInt()+1);
    print(prefs.getLevelFromSharedPref('level'));
    if(status == "over"){
      await prefs.saveLevelToSharedPref('level', 1);
    }
    setState(() {
      level = currentLevel??=1;
    });
  }

  // logic for backspace functionality
  onDelete(){
    setState(() {
      if (tileCount>=5) {
      tileCount = tileCount-1;
      }
      if(activeTileSet == 0 ){
        tileList1[tileCount]="" ;
      }else if (activeTileSet == 1){
        tileList2[tileCount]="" ;
      }else if(activeTileSet == 2 ){
        tileList3[tileCount]="" ;
      }else if(activeTileSet == 3 ){
        tileList4[tileCount]="" ;
      }else if(activeTileSet == 4 ){
        tileList5[tileCount]="" ;
      }else if(activeTileSet == 5 ){
        tileList6[tileCount]="" ;
      }
      if (tileCount>=1) {
        tileCount = tileCount -1;
      }    
    });
  }

  // modal for when the user loses
  onGameLoss(){
     return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: SizedBox(
            height: 200,
            width: 300,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("GAME OVER" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      super.dispose();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const StartScreen()), (Route<dynamic> route) => false);
                    },
                    child: Text("Exit", style: TextStyle(color: Colors.blue[400]),),
                  )
                ],
              ),
              const Divider(
                height: 10
              ),
              const SizedBox(height: 50,),
              Center(child: 
              Column(
                children: [
                  const Text("The word was"),
                  const SizedBox(height: 15,),
                  Text(tempWord.toUpperCase(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green[800]),)
                ],
              ))
            ]),
          )
        );
      }
    );
  }

  // modal for when user completes the level
  onGameWin(){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                const Text("CONGRATULATIONS", style: TextStyle(fontWeight: FontWeight.bold),),
                const Divider(
                  height: 15,

                ),
                const SizedBox(height: 40,),
                Text("LEVEL ${level}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 25,),
                activeTileSet==0?
                const Text("Solved in a single step"):Text("Solved in ${activeTileSet+1} steps"),
                 const SizedBox(height: 75),
                const Divider(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  GestureDetector(
                    onTap: () {
                      score("over");
                      levelUpdate("over");
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const StartScreen()), (Route<dynamic> route) => false);  
                    },
                    child: const Text("Exit to home screen"),
                  ),
                  GestureDetector(
                    onTap: () {
                      super.dispose();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const SinglePlayer()), (Route<dynamic> route) => false);                      
                    },
                    child: const Text("Next level"),
                  )
                ],)
              ],
            ),
          ),
        );
      }
    );
  }

  // function to verify wether its an actual word or not
  bool wordVerification(word){
    for (var i = 0; i < words.length; i++) {
      if (word == words[i]) {
        return true;
      }
    }
    return false;
  }

  // function for when user submits the word
  onSubmit(){
    late String tempSubittedWord;
    bool wordExists = true;
    if(activeTileSet == 0 ){
      tempSubittedWord = tileList1.join();
      wordExists = wordVerification(tempSubittedWord);
      if (wordExists == true) {
        for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList1[i]== tempWord[j] && i==j){
              status1[i] = "correct";
          }else if(tileList1[i]== tempWord[j]){
              status1[i] = "kinda";
          }
        }
      }
      }
      
      setState(() {
        status1;
      });
    }else if (activeTileSet == 1){
      tempSubittedWord = tileList2.join();
      wordExists = wordVerification(tempSubittedWord);
      if(wordExists==true){

      }
      for (var i = 0; i< tileList2.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList2[i]== tempWord[j] && i==j){
            setState(() {
              status2[i] = "correct";
            });
          }else if(tileList2[i]== tempWord[j]){
            setState(() {
              status2[i] = "kinda";
            });
          }
        }
      }
    }else if(activeTileSet == 2){
      tempSubittedWord = tileList3.join();
      wordExists = wordVerification(tempSubittedWord);
      if(wordExists==true){
      for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList3[i]== tempWord[j] && i==j){
            setState(() {
              status3[i] = "correct";
            });
          }else if(tileList3[i]== tempWord[j]){
            setState(() {
              status3[i] = "kinda";
            });
          }
        }
      }
      }
      
    }else if(activeTileSet == 3){
      tempSubittedWord = tileList4.join();
      wordExists = wordVerification(tempSubittedWord);
      if(wordExists==true){
        for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList4[i]== tempWord[j] && i==j){
            setState(() {
              status4[i] = "correct";
            });
          }else if(tileList4[i]== tempWord[j]){
            setState(() {
              status4[i] = "kinda";
            });
          }
        }
      } 
      }
      
    }else if(activeTileSet == 4){
      tempSubittedWord = tileList5.join();
      wordExists = wordVerification(tempSubittedWord);
      if(wordExists==true){
      for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList5[i]== tempWord[j] && i==j){
            setState(() {
              status5[i] = "correct";
            });
          }else if(tileList5[i]== tempWord[j]){
            setState(() {
              status5[i] = "kinda";
            });
          }
        }
      } 
      }
      
    }else if(activeTileSet == 5){
      activeTileSet=6;
      tempSubittedWord = tileList6.join();
      wordExists = wordVerification(tempSubittedWord);
      if(wordExists==true){
      for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; i++) {
          if(tileList6[i]== tempWord[j] && i==j){
            setState(() {
              status6[i] = "correct";
            });
          }else if(tileList6[i]== tempWord[j]){
            setState(() {
              status6[i] = "kinda";
            });
          }
        }
      }
      }
      
    }else{
      tempSubittedWord = "";
    }
    if(tempWord == tempSubittedWord){
      onGameWin();
      score("continue");
      levelUpdate("continue");     
    }
    else if(activeTileSet>5){
      onGameLoss();
      score("over");
      levelUpdate("over");
    }
    else{
      if (wordExists == true) {
        setState(() {
        activeTileSet = activeTileSet + 1;
        tileCount = 0;
        tileSet = tileSet +1;
      });
      }
      
    }
  }

  // modal for when user presses back button when in middle of a game
  onBackPressed(){
    return showDialog(
      context: context, 
      builder: (context) =>AlertDialog(
        title: const Text("Do you really want to exit to the main screen?"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: ()=>Navigator.pop(context), 
            child: const Text("no")),
          ElevatedButton(onPressed: (){
            super.dispose();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const StartScreen()), (Route<dynamic> route) => false);
          }, 
          child: const Text("Yes"))
        ],
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>onBackPressed(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child:Text("LEVEL ${level}")),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: GradientColors.winterNeva,
              
            )),
          child:SingleChildScrollView(
          child:Container(
            margin: const EdgeInsets.only(top:40, left: 12, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status:status1[0], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileLetter: tileList1[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status1[1], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileLetter: tileList1[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status1[2], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileLetter: tileList1[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status1[3], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileLetter: tileList1[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status1[4], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileLetter: tileList1[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status: status2[0], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileLetter: tileList2[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status2[1], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileLetter: tileList2[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status2[2], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileLetter: tileList2[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status2[3], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileLetter: tileList2[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status2[4], activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileLetter: tileList2[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status: status3[0] ,activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileLetter: tileList3[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status3[1] ,activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileLetter: tileList3[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status3[2] ,activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileLetter: tileList3[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status3[3] ,activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileLetter: tileList3[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status3[4] ,activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileLetter: tileList3[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status: status4[0],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileLetter: tileList4[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status4[1],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileLetter: tileList4[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status4[2],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileLetter: tileList4[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status4[3],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileLetter: tileList4[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status: status4[4],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileLetter: tileList4[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status:status5[0],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileLetter: tileList5[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status5[1],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileLetter: tileList5[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status5[2],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileLetter: tileList5[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status5[3],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileLetter: tileList5[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status5[4],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileLetter: tileList5[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:  TileBox(status:status6[0],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileLetter: tileList6[0]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status6[1],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileLetter: tileList6[1]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status6[2],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileLetter: tileList6[2]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status6[3],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileLetter: tileList6[3]),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          child:  TileBox(status:status6[4],activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileLetter: tileList6[4]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(alphabets.length, (index){
                      return
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5,10),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(activeTileSet == 0 && tileCount<=4){
                                  tileList1[tileCount] = alphabets[index];
                                }else if (activeTileSet == 1&& tileCount<=4){
                                  tileList2[tileCount] = alphabets[index];
                                }else if(activeTileSet == 2 && tileCount<=4){
                                  tileList3[tileCount] = alphabets[index];
                                }else if(activeTileSet == 3 && tileCount<=4){
                                  tileList4[tileCount] = alphabets[index];
                                }else if(activeTileSet == 4 && tileCount<=4){
                                  tileList5[tileCount] = alphabets[index];
                                }else if(activeTileSet == 5 && tileCount<=4){
                                  tileList6[tileCount] = alphabets[index];
                                }
                                tileCount<4? tileCount = tileCount +1:tileCount = 5;                         
                              });
                            },
                            child:  Container(
                              height: 33,
                              width: 27,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(child: Text(alphabets[index], style: const TextStyle(fontSize: 16),),),
                            ),
                          ),
                        );
                      })
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          if(tileCount >= 4){
                            onSubmit();  
                          }
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:const[Text("Submit Word")] ,)),                    
                      const SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: (){
                          onDelete();
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:const [Text("Backspace")] ,
                          )
                        )
                      ],
                    )
                  ],
              ),
            )
          ),
        )
      ),
    );
  }
}