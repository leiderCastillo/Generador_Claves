import 'package:code_generator/models/levelsecurity.dart';
import 'package:code_generator/models/listcheck.dart';
import 'package:code_generator/theme/theme.dart';
import 'package:flutter/material.dart';

int sizeCharacter = 12;
bool minusculas= false;
bool mayusculas= false;
bool numeros = false;
bool simbolos = false;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: ColorsApp.bg,
      body:
      Center(
        child: 
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width > 500 ? 500 :MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  color: ColorsApp.greyligth,
                  blurRadius: 10
                )
              ]
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.fromLTRB(20,30,20,20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Generador de contraseñas",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
                Container(
                  color: ColorsApp.bg,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("C0NTR4\$EÑa!",style: TextStyle(color: ColorsApp.greydark,),textScaleFactor: 1.2,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.copy,color: ColorsApp.blue,))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Longitud de carácter",style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.2,),
                    Text("$sizeCharacter",style: TextStyle(fontWeight: FontWeight.bold,color: ColorsApp.blue),textScaleFactor: 1.4)
                  ],
                ),
                Slider(
                  min: 0,
                  max: 100,
                  value: sizeCharacter.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      sizeCharacter = value.toInt();
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras mayúsculas",
                  value: mayusculas,
                  onChanged: (value) {
                    setState(() {
                      mayusculas = value;
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras minúsculas",
                  value: minusculas,
                  onChanged: (value) {
                    setState(() {
                      minusculas = value;
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras números",
                  value: numeros,
                  onChanged: (value) {
                    setState(() {
                      numeros = value;
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras símbolos",
                  value: simbolos,
                  onChanged: (value) {
                    setState(() {
                      simbolos = value;
                    });
                  },
                ),
                LevelSecurity(
                  containMay: mayusculas,
                  containMin: minusculas,
                  containNumber: numeros,
                  containSymbol: simbolos,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsApp.blue,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    fixedSize: Size(MediaQuery.of(context).size.width, 40)
                  ),
                  onPressed: (){},
                  child: const Text("Generar contraseña")
                )
                

              ],
            ),
          )
      )
    );
  }
}