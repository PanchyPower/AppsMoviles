import 'package:flutter/material.dart';
import 'package:reina_emprende/screens/login.dart';
import 'package:reina_emprende/screens/foro.dart';
import 'productitos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reina_emprende/screens/publicaciones.dart';

class ComunidadScreen extends StatefulWidget {
  const ComunidadScreen({super.key});

  @override
  State<ComunidadScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ComunidadScreen> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
   if (index == 2) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const ProductsScreen()),
  );
} else if (index == 1) {
  setState(() => _currentIndex = index);
} else {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const ForoScreen()),
  );
}

  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Comunidad', style: TextStyle(color: Colors.white)),
        actions: [
          Icon(Icons.shopping_cart, color: Colors.white),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _signOut,
          ), 
        ],
        
      ),

      
      backgroundColor: Colors.white,
      
body: ListView( 
  
  //Pa que el scroll funcionee

children:  [Column(
  mainAxisAlignment: MainAxisAlignment.center,

  children: <Widget>[


//PRIMERA CARD - PREGUNTA SOBRE EL PRODUCTACOOO
    Card(
      margin: const EdgeInsets.all(20),
  child: Padding(
    padding: const EdgeInsets.all( 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Row(
          children: [
            Image.asset(
              'assets/ellipse_1.png', width: 50, height: 50,), //Foto de perfil 1
            SizedBox(width: 30), //E S P A C I O PAL LADO
            Text(
              "Sofia Aguilera",
              style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, ), 
              ), //Estilaso de la letra perfil: Tamaño, negritaaaa
              SizedBox(height: 70), //E S P A C I O PA ABAJO
          ],
        ),

        Image.asset('assets/productoforo.png', width: double.infinity, fit: BoxFit.cover, height: 200,), //Foto productooooooo, el doble infinito y el boxfit para que complete el ancho de la card y la altura limitada pa que no se vea tan M A L
   SizedBox(height: 20), //E S P A C I O PA ABAJOOO OTRA VEZ

        Text(
          "Busco algo parecido a este collar, alguien que sepa si lo venden por aca, gracias",
          style: TextStyle(fontSize: 14), 
        ),
      ],
    ),
  ),
),

//FINAL DE PRIMERA CARD

//INICIO SEGUNDA CARD

Card(
   margin: const EdgeInsets.all(20), //Bordee

  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Row(
          children: [
            Image.asset(
              'assets/perfil.png', width: 50, height: 50,), //Foto de perfil 2 + tamañoo
            SizedBox(width: 30), //E S P A C I O PAL LADO
            Text(
              "Francisca Herz",
              style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, ), 
              ), //Estilaso de la letra perfil: Tamaño, negritaaaa
              SizedBox(height: 70), //E S P A C I O PA ABAJO
          ],
        ),

        
        Text(
          "¿Alguien que este vendiendo anillos de plata baratos y con envio?",
          style: TextStyle(fontSize: 14),
        ),
      ],
    ),
  ),
),

 //FINAL CARD 2
 
 //INICIO CARD TREH

Card(
   margin: const EdgeInsets.all(20), //bordee

  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Row(
          children: [
            Image.asset(
              'assets/masperfil.png', width: 50, height: 50,), //Foto de perfil treh + tamañoo
            SizedBox(width: 30), //E S P A C I O PAL LADO
            Text(
              "Andrés Figueroa",
              style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, ), 
              ), //Estilaso de la letra perfil: Tamaño, negritaaaa
              SizedBox(height: 70), //E S P A C I O PA ABAJO
          ],
        ),

        
        Text(
          "¿Si quiero vender un producto es necesario que coloqué mi ubicación o puedo hacerlo sin ponerla?, que es para vender una cosa rapida",
          style: TextStyle(fontSize: 14),
        ),
      ],
    ),
  ),
),

 //FINAL CARD T R E H
 

  ],
  ),

]

),





 
floatingActionButton: FloatingActionButton( //BOTON BACAN QUE FLOTA - PAN!!!! ENCONTRE EL MEDIO VIDEO DE COMO LO EXPLICAN Y ME SALIO A LA PRIMERA S O Y F E L I Z C:
    backgroundColor: Color.fromARGB(255, 65, 185, 225), //color del fondo del boton
     shape: CircleBorder(), //Para que sea redondo el boton
    child: const Icon(Icons.add, color: Colors.white), //Icono del boton y el color del icono
    onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PublicacionPage()),
            ),
  ),

     
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.primaryContainer,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups, color: Color(0xFFB4E6FF)),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xFFB4E6FF)),
            label: 'Buscar',
          ),
        ],
),

    );
  }

  
}


