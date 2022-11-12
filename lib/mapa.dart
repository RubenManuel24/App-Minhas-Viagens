import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {



   final Completer<GoogleMapController> _controller = Completer();
   Set<Marker> _marcador = {};
  
  _onMapCreated(GoogleMapController googleMapController){
    _controller.complete(googleMapController);
  }

   //Metodo para exibir marcador na tela ao pressionar a tela num local do mapa
  _exibirMarcador(LatLng latLng){
     print("Local clicado: "+latLng.toString());

     Marker locarMarcado = Marker(
       markerId: MarkerId("Local marcado - ${latLng.latitude} - ${latLng.longitude}"),
       position: latLng,
       infoWindow: InfoWindow(title: "Local Viajado"),
       icon: BitmapDescriptor.defaultMarkerWithHue( BitmapDescriptor.hueViolet)
       );

       setState(() {
         _marcador.add(locarMarcado);
       });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0066cc),
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          onLongPress: _exibirMarcador,
          initialCameraPosition: CameraPosition(
            target: LatLng(-8.85805, 13.21924),
            zoom: 18
            ),
            markers: _marcador,
        )
      )
    );
  }
}
