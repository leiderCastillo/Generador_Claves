import 'package:code_generator/theme/theme.dart';
import 'package:flutter/material.dart';

class LevelSecurity extends StatefulWidget {
  final bool containNumber;
  final bool containMay;
  final bool containMin;
  final bool containSymbol;
  final double alto;

  const LevelSecurity({
    super.key,
    this.alto = 40,
    required this.containMay,
    required this.containMin,
    required this.containNumber,
    required this.containSymbol,
  });

  @override
  State<LevelSecurity> createState() => _LevelSecurityState();
}

class _LevelSecurityState extends State<LevelSecurity> {

  Color colorBg = Colors.grey;
  int numero = 0;

  @override
  Widget build(BuildContext context) {

    if(widget.containMay && widget.containMin && widget.containNumber && widget.containSymbol){
      colorBg  = ColorsApp.blue;
      numero = 4;
    } else if ((widget.containMay || widget.containMin) && widget.containNumber && widget.containSymbol){
      colorBg  = ColorsApp.green;
      numero = 3;
    } else if ((widget.containMay || widget.containMin) && (widget.containNumber || widget.containSymbol)){
      colorBg = Colors.yellow;
      numero = 2;
    }else if (widget.containNumber && widget.containSymbol){
      colorBg  = ColorsApp.yellow;
      numero = 2;
    }
    else if (widget.containMay || widget.containMin || widget.containNumber || widget.containSymbol){
      colorBg =  ColorsApp.red;
      numero = 1;
    } else{
      numero = 0;
      colorBg = Colors.grey;
    }

    return Container(
      height: widget.alto,
      color: ColorsApp.bg,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Nivel de seguridad",style: TextStyle(color: ColorsApp.greydark,),textScaleFactor: 1.1,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration:  const Duration(milliseconds: 200),
                height: widget.alto/4,
                width: 5,
                margin: const EdgeInsets.only(right: 2),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: numero >= 1 ?  colorBg : ColorsApp.greyligth,
                ),
              ),
              AnimatedContainer(
                duration:  const Duration(milliseconds: 200),
                height: widget.alto/3,
                width: 5,
                margin: const EdgeInsets.only(right: 2),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:numero >= 2 ?  colorBg : ColorsApp.greyligth,
                ),
                
              ),
              AnimatedContainer(
                duration:  const Duration(milliseconds: 200),
                height: widget.alto/2.5,
                width: 5,
                margin: const EdgeInsets.only(right: 2),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: numero >= 3 ?  colorBg : ColorsApp.greyligth,
                ),
              ),
              AnimatedContainer(
                duration:  const Duration(milliseconds: 200),
                height: widget.alto,
                width: 5,
                margin: const EdgeInsets.only(right: 2),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: numero >= 4 ?  colorBg : ColorsApp.greyligth,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}