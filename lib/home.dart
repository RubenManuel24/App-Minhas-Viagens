import 'package:flutter/material.dart';
import 'package:minhas_viagens/mapa.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> listaViagens = [
    "Luanda",
    "Maputo",
    "São Paulo",
    "París",
    "Roma",
    "Berlím",
    "Lisboa",
    "Porto",
    "Praia",
    "Rio de Janeiro",
    "Tóquio",
    "Namibe",
    "Londres",
    "Nova York"
  ];

  _adicionarViagem(){
    Navigator.push(context, 
     MaterialPageRoute(builder: (context) => Mapa())
    );
  }

  _abrirMapa(){
    print("Abrir Mapa");
  }

  _eliminarViagens(){
    print("Eliminar Viagens");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0066cc),
        title: Text("Minhas Viagens"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0066cc),
        onPressed: (){
          _adicionarViagem();
        },
        child: Icon(Icons.add_location, color: Colors.white,),
      ) ,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(

              itemCount: listaViagens.length,
              itemBuilder: (context, index){
               
               var cor = Color.fromARGB(204, 107, 174, 238);
               if(index % 2 == 0){
                  cor =  Color.fromARGB(255, 86, 67, 141);
               }
               
                String tituloViagens = listaViagens[index];

                return Card(
                  color: cor,
                  child: GestureDetector(
                     onTap: (){
                       _abrirMapa();
                     },
                     child: ListTile(
                       title: Text(tituloViagens),
                       trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                         GestureDetector(
                            onTap: (){
                              _eliminarViagens();
                            },
                            child: Icon(Icons.delete_forever, color: Colors.red,),
                        ),
                      ],
                     )
                    ),
                  ),
                );

              })
          )
        ],
      )
    );
  }
}