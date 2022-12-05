import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wordlr_mmultiplayer/widgets/text_box_field.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_box.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_set.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {

  List skills = [1,2,3,4,5];

  List alphabets = ["a","b","c","d","e",'f',"g","h","i","j","k","l","m","n","o","p","q","r","s",'t',"u","v","w","x","y","z"];

  int activeTileSet = 0;
  int tileCount = 0;
  List tileList1 = ["","","","",""];
  List tileList2 = ["","","","",""];
  List tileList3 = ["","","","",""];
  List tileList4 = ["","","","",""];
  List tileList5 = ["","","","",""];
  List tileList6 = ["","","","",""];

  int tileNumber = 0;
  int tileSet = 0;
  String tempWord = "whale";
  // TextEditingController controller1 = TextEditingController();
  // TextEditingController controller2 = TextEditingController();
  // TextEditingController controller3 = TextEditingController();
  // TextEditingController controller4 = TextEditingController();
  // TextEditingController controller5 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // function for when user submits the word
  onSubmit(){
    late String tempSubittedWord;
    if(activeTileSet == 0){
      tempSubittedWord = tileList1.join();
    }else if (activeTileSet == 1){
      tempSubittedWord = tileList2.join();  
    }else if(activeTileSet == 2){
      tempSubittedWord = tileList3.join();  
    }else if(activeTileSet == 3){
      tempSubittedWord = tileList4.join();  
    }else if(activeTileSet == 4){
      tempSubittedWord = tileList5.join();  
    }else if(activeTileSet == 5){
      tempSubittedWord = tileList6.join();  
    }else{
      tempSubittedWord = "";
    }
    if(tempWord == tempSubittedWord){
      print("yay");
    }
    else if(activeTileSet>6){
      print("fail");
    }
    else{
      setState(() {
        activeTileSet = activeTileSet + 1;
        tileCount = 0;
        tileSet = tileSet +1;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single player"),
      ),
      body: Container(
        child:SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.only(top:50, left: 10, right: 10),
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
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileletter: tileList1[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileletter: tileList1[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileletter: tileList1[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileletter: tileList1[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:0, tileNumber:tileCount, tileletter: tileList1[4]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileletter: tileList2[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileletter: tileList2[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileletter: tileList2[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileletter: tileList2[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:1, tileNumber:tileCount, tileletter: tileList2[4]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileletter: tileList3[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileletter: tileList3[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileletter: tileList3[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileletter: tileList3[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:2, tileNumber:tileCount, tileletter: tileList3[4]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileletter: tileList4[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileletter: tileList4[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileletter: tileList4[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileletter: tileList4[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:3, tileNumber:tileCount, tileletter: tileList4[4]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileletter: tileList5[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileletter: tileList5[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileletter: tileList5[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileletter: tileList5[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:4, tileNumber:tileCount, tileletter: tileList5[4]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileletter: tileList6[0]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileletter: tileList6[1]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileletter: tileList6[2]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileletter: tileList6[3]),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        child:  TileBox(activeTileSet: activeTileSet, tileSet:tileSet, currentTile:5, tileNumber:tileCount, tileletter: tileList6[4]),
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
                            height: 30,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text(alphabets[index]),),
                          ),
                        ),
                      );
                    })
                  ),
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(tileCount >= 4){
                              onSubmit();
                               
                              }
                          }, 
                          child: Center(child: Text("enter"),))
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