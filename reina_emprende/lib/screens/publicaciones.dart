import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reina_emprende/screens/comunidad.dart';
import 'package:flutter/foundation.dart';   // <-- NECESARIO PARA kIsWeb
import 'dart:io';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PublicacionPage(),
    );
  }
}

class PublicacionPage extends StatefulWidget {
  @override
  _PublicacionPageState createState() => _PublicacionPageState();
}

class _PublicacionPageState extends State<PublicacionPage> {
  File? _selectedImage;                  
  Uint8List? _webImage;                  
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      } else {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4169E1),
        iconTheme: IconThemeData(color: Colors.white),
        leading: const Icon(Icons.search),
        actions: const [
          Icon(Icons.shopping_cart, color: Colors.white),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20),

            Text(
              "Crear publicación",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.multiline, maxLines: 4,decoration: InputDecoration(
                hintText:
                    "Escribe de lo que quieras o te guste hablar y conoce a más personas",
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18), border: OutlineInputBorder(borderRadius: BorderRadius.circular(6),
),
              ),
            ),

            SizedBox(height: 20),

//IMAGEN OPCIONAL
            Text(
              "Imagen (Opcional)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20),

// CUADRADO HERMOSO GIGANTE
            GestureDetector(
              onTap: _pickImage,
              child: Container( height: 250,width: double.infinity,decoration: BoxDecoration(color: Color.fromARGB(255, 191, 203, 240), borderRadius: BorderRadius.circular(16),
                ),

                child: Center(
                  child: _webImage != null || _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: kIsWeb
                              ? Image.memory(_webImage!,width: double.infinity, height: 250, fit: BoxFit.cover,)
                              : Image.file(  _selectedImage!,width: double.infinity, height: 250,fit: BoxFit.cover,),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.image_outlined,size: 50, color: Colors.blue),SizedBox(height: 10),
                         ],
                        ),
                ),
              ),
            ),

             SizedBox(height: 20),

            //BOTONACO DE PUBLICACIÓN
            SizedBox(width: double.infinity, child: FloatingActionButton.extended(
              onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ComunidadScreen()),
            ),
                  // PUCHALE EL FIREBASE REINOTA
                
                
                label: const Text(
                  "PUBLICAR",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                backgroundColor: Color.fromARGB(255, 33, 198, 243), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
