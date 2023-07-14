import 'package:code_generator/functions/checkcharactersmin.dart';
import 'package:code_generator/functions/generatepassword.dart';
import 'package:code_generator/models/levelsecurity.dart';
import 'package:code_generator/models/listcheck.dart';
import 'package:code_generator/theme/theme.dart';
import 'package:flutter/material.dart';

int sizeCharacter = 12;
int minSlider = 0;
bool minusculas= false;
bool mayusculas= false;
bool numeros = false;
bool simbolos = false;
String clavegenerada = "C0NTR4\$EÑa!";

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
                      Expanded(
                        child:
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:Text(clavegenerada,style: TextStyle(color: ColorsApp.greydark,),textScaleFactor: 1.2,),
                          )
                      ),
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
                  min: minSlider.toDouble(),
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
                      int seleccionados = checkcharactersmin(minusculas, mayusculas, numeros, simbolos);
                      sizeCharacter = sizeCharacter < seleccionados ? seleccionados : sizeCharacter;
                      minSlider = seleccionados;
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras minúsculas",
                  value: minusculas,
                  onChanged: (value) {
                    setState(() {
                      minusculas = value;
                      int seleccionados = checkcharactersmin(minusculas, mayusculas, numeros, simbolos);
                      sizeCharacter = sizeCharacter < seleccionados ? seleccionados : sizeCharacter;
                      minSlider = seleccionados;
                      
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras números",
                  value: numeros,
                  onChanged: (value) {
                    setState(() {
                      numeros = value;
                      int seleccionados = checkcharactersmin(minusculas, mayusculas, numeros, simbolos);
                      sizeCharacter = sizeCharacter < seleccionados ? seleccionados : sizeCharacter;
                      minSlider = seleccionados;
                      
                    });
                  },
                ),
                ListCheck(
                  text: "Incluye letras símbolos",
                  value: simbolos,
                  onChanged: (value) {
                    setState(() {
                      simbolos = value;
                      int seleccionados = checkcharactersmin(minusculas, mayusculas, numeros, simbolos);
                      sizeCharacter = sizeCharacter < seleccionados ? seleccionados : sizeCharacter;
                      minSlider = seleccionados;
                      
                      
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
                  onPressed: (){
                    if(checkcharactersmin(minusculas, mayusculas, numeros, simbolos)!= 0){
                      setState(() {
                        clavegenerada = generatepassword(sizeCharacter, numeros, mayusculas, minusculas, simbolos);
                      });
                    }else{
                      print("No se selecciono ningun valor");
                    }
                    
                  },
                  child: const Text("Generar contraseña")
                )
                

              ],
            ),
          )
      )
    );
  }
}