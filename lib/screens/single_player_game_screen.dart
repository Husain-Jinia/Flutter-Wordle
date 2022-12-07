import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wordlr_mmultiplayer/screens/start_screen.dart';
import 'package:wordlr_mmultiplayer/widgets/text_box_field.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_box.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_set.dart';
import 'package:wordlr_mmultiplayer/word_list.dart';
import "dart:math";

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {

  List alphabets = ["a","b","c","d","e",'f',"g","h","i","j","k","l","m","n","o","p","q","r","s",'t',"u","v","w","x","y","z"];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onGameLoss(){
     return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: Container(
            height: 200,
            width: 300,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("GAME OVER" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const StartScreen(),
                        ),
                      ); 
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

  onGameWin(){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: Container(
            height: 250,
            width: 300,
            child: Column(
              children: [
                Text("CONGRATULATIONS", style: TextStyle(fontWeight: FontWeight.bold),),
                Divider(
                  height: 15,

                ),
                const SizedBox(height: 40,),
                Text("LEVEL 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 25,),
                activeTileSet==0?
                Text("Solved in a single step"):Text("Solved in ${activeTileSet+1} steps"),
                 const SizedBox(height: 75),
                 Divider(
                  height: 15,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const StartScreen(),
                        ),
                      );
                    },
                    child: Text("Exit to home screen"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SinglePlayer(),
                        ),
                      );
                       
                    },
                    child: Text("Next level"),
                  )
                ],)
              ],
            ),
          ),
        );
      }
    );
  }

  // function for when user submits the word
  onSubmit(){
    late String tempSubittedWord;
    List splitAnswer = tempWord.split("");
    if(activeTileSet == 0){
      tempSubittedWord = tileList1.join();
      for (var i = 0; i< tileList1.length; i++) {
        for (var j = 0; j < tempWord.length; j++) {
          if(tileList1[i]== tempWord[j] && i==j){
              status1[i] = "correct";
          }else if(tileList1[i]== tempWord[j]){
              status1[i] = "kinda";
          }
        }
      }
      setState(() {
        status1;
      });
    }else if (activeTileSet == 1){
      tempSubittedWord = tileList2.join();
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
        // if(status2[i] == ""){
        //   status2[i] = "incorrect";
        // }
      }
    }else if(activeTileSet == 2){
      tempSubittedWord = tileList3.join();
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
        // if(status3[i] == ""){
        //   status3[i] = "incorrect";
        // }
      }
    }else if(activeTileSet == 3){
      tempSubittedWord = tileList4.join();
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
        // if(status4[i] == ""){
        //   status4[i] = "incorrect";
        // }
      } 
    }else if(activeTileSet == 4){
      tempSubittedWord = tileList5.join();
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
        // if(status5[i] == ""){
        //   status5[i] = "incorrect";
        // }
      } 
    }else if(activeTileSet == 5){
      activeTileSet=6;
      tempSubittedWord = tileList6.join();
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
        // if(status6[i] == ""){
        //   status6[i] = "incorrect";
        // }
      }
    }else{
      tempSubittedWord = "";
    }
    print(tempWord.split(""));
    if(tempWord == tempSubittedWord){
      onGameWin();
    }
    else if(activeTileSet>5){
      onGameLoss();
    }
    else{
      setState(() {
        activeTileSet = activeTileSet + 1;
        tileCount = 0;
        tileSet = tileSet +1;
      });
    }
    print(status1);
    print(status2);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single player"),
      ),
      body: Container(
        child:SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.only(top:40, left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: List.generate(skills.length, (index){
                  //   return
                  //     Container(
                  //       padding: EdgeInsets.fromLTRB(5, 0, 5,0),
                  //       child: GestureDetector(
                  //         onTap: (){},
                  //         child:  TileBox(),
                  //       ),
                  //     );
                  //   })
                  // ),
                  // const SizedBox(height: 15,),
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
                  SizedBox(height: 20,),
                  Wrap(
                    
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(alphabets.length, (index){
                    return
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5,10),
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
                              tileCount<4? tileCount = tileCount +1:tileCount = 999;                         
                            });
                          },
                          child:  Container(
                            height: 33,
                            width: 27,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(child: Text(alphabets[index], style: TextStyle(fontSize: 16),),),
                          ),
                        ),
                      );
                    })
                ),
                  Container(
                    child: Row(
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
                            children:const[Text("Enter")] ,)),
                        
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: (){
                            
                          }, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:const [Text("Backspace")] ,))
                      ],
                    ),
                  )
                ],
            ),
          )
        ),
      )
    );
  }
}