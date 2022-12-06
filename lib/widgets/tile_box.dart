import 'package:flutter/material.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_set.dart';

class TileBox extends StatefulWidget {
  int activeTileSet;
  int tileSet;
  int tileNumber;
  String tileLetter;
  int currentTile;
  String status;
  TileBox({Key? key, required this.activeTileSet,required this.tileSet, required this.tileNumber, required this.tileLetter, required this.currentTile, required this.status}) : super(key: key);

  @override
  State<TileBox> createState() => _TileBoxState();
}

class _TileBoxState extends State<TileBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: widget.activeTileSet == widget.currentTile ? 
        Colors.grey[400] :(widget.status == "correct" && widget.activeTileSet != widget.currentTile)? 
        Colors.green[400]:(widget.status == "kinda" && widget.activeTileSet != widget.currentTile)? 
        Colors.yellow[800]:(widget.status == "incorrect" && widget.activeTileSet != widget.currentTile)? 
        Colors.grey[800] : 
        Colors.grey[300],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(widget.tileLetter.toUpperCase(), style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),),), 
    );
  }
}