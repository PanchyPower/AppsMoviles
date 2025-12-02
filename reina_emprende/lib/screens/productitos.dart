import 'package:flutter/material.dart';
import 'package:reina_emprende/screens/comunidad.dart';
import 'package:reina_emprende/screens/foro.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  int _currentIndex = 2;

  void _onTabTapped(int index) {
  if (index == 2) {
    setState(() => _currentIndex = index);
  } else if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ComunidadScreen()),
    );
  } else if (index == 0) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const ForoScreen()),
  );
  }

}


   @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Color(0xFF4169E1),
          iconTheme: IconThemeData(color: Colors.white),//Cambio de color de iconooo
          leading: const Icon(Icons.search), //ICONO DE LUPA PA BUSCAR
        
          actions: const [
            Icon(Icons.shopping_cart), // ICONO COMPRA CARRITOOOO

    
          ],
        ),
     
  body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

   SizedBox(height: 40),


Row(
  mainAxisAlignment: MainAxisAlignment.center, 
  children: [

  Image.asset('assets/otroperfil.png', width: 200, scale: 0.3,
)

  ],
),


       Center(

        
                        child: Text(
                "Usuario 435",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

),

   Center(
                        child: Text(
                "¡Haz tu primera publicación!",
                style: TextStyle(fontSize: 12),
              ),
        
),






              SizedBox(height: 40),

           Text(
                "Descripción Tienda",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

  

 

SizedBox(height: 10), //E S P A C I O PA ABAJOOO OTRA VEZ

  TextField(keyboardType: TextInputType.multiline, maxLines: 4, decoration: InputDecoration(
                  hintText: "Escribe la descripción de tu tienda, que vendes,etc.", contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18), border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), 

                  ),
                ),
              ),

SizedBox(height: 30), //E S P A C I O PA ABAJOOO OTRA VEZ

Text(
                "Mapa/Puntos de entrega",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

SizedBox(height: 10), //E S P A C I O PA ABAJOOO OTRA VEZ

               TextField(keyboardType: TextInputType.multiline, decoration: InputDecoration(
                  hintText: "Ingresa tu ubicación", contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18), border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), 

                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
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
            icon: Icon(Icons.home, color: Color(0xFFB4E6FF)),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: 'Perfil',
          ),
        ],
),

      );
  }




}
      

