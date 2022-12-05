import 'package:flutter/material.dart';
import 'package:wordlr_mmultiplayer/widgets/tile_set.dart';

class TileBox extends StatefulWidget {
  int activeTileSet;
  int tileSet;
  int tileNumber;
  String tileletter;
  int currentTile;
  TileBox({Key? key, required this.activeTileSet,required this.tileSet, required this.tileNumber, required this.tileletter, required this.currentTile}) : super(key: key);

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
        color: widget.activeTileSet != widget.currentTile? Colors.grey[300] : Colors.grey[400],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(widget.tileletter),), 
    );
  }
}