import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reina_emprende/screens/login.dart';
import 'productitos.dart';
import 'package:reina_emprende/screens/comunidad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reina_emprende/screens/detalles_productitos.dart';

class ForoScreen extends StatefulWidget {
  const ForoScreen({super.key});

  @override
  State<ForoScreen> createState() => _ForoScreenState();
}

//BOTTOM BAR
class _ForoScreenState extends State<ForoScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  int _currentIndex = 0;

  void _onTabTapped(int index) {
  if (index == 0) {
    setState(() => _currentIndex = index);
  } else if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ComunidadScreen()),
    );
  } else if (index == 2) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const ProductsScreen()),
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

  void _addPublicacion(BuildContext context) async {
    final usuarioController = TextEditingController();
    final mensajeController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Escribir publicación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: mensajeController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Mensaje',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                    alignLabelWithHint: true,
                  ),
                ),
            
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        final usuario = usuarioController.text.trim();
                        final mensaje = mensajeController.text.trim();

                        if (usuario.isNotEmpty && mensaje.isNotEmpty) {
                          await FirebaseFirestore.instance.collection('publicacion').add({
                            'usuario': usuario,
                            'mensaje': mensaje,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Publicación subida correctamente')),
                          );
                        }
                      },
                      child: const Text('Publicar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editPublication(BuildContext context, String docId, Map<String, dynamic> data) async {
    final usuarioController = TextEditingController(text: data['usuario']);
    final mensajeController = TextEditingController(text: data['mensaje']);

    await showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Editar producto',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: mensajeController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
                
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        final usuario = usuarioController.text.trim();
                        final mensaje = mensajeController.text.trim();


                        if (usuario.isNotEmpty && mensaje.isNotEmpty) {
                          await FirebaseFirestore.instance.collection('publicacion').doc(docId).update({
                            'usuario': usuario,
                            'mensajen': mensaje,
                          });

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Producto actualizado correctamente')),
                          );
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    void _deletePublication(BuildContext context, String docId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar producto'),
        content: const Text('¿Estás seguro de que quieres eliminar este producto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await FirebaseFirestore.instance.collection('publicacion').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto eliminado correctamente')),
      );
    }
  }

   @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Publicaciones recientes', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _signOut,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductsScreen()),
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar publicaciones...',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,


    floatingActionButton: FloatingActionButton( //BOTON BACAN QUE FLOTA - PAN!!!! ENCONTRE EL MEDIO VIDEO DE COMO LO EXPLICAN Y ME SALIO A LA PRIMERA S O Y F E L I Z C:
    backgroundColor: Color.fromARGB(255, 65, 185, 225), //color del fondo del boton
     shape: CircleBorder(), //Para que sea redondo el boton
    child: const Icon(Icons.add, color: Colors.white), //Icono del boton y el color del icono
    onPressed: () => _addPublicacion(context),
  ),

  body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('publicacion')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar productos'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          final filteredDocs = docs.where((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final title = (data['title'] ?? '').toString().toLowerCase();
            return title.contains(_searchText);
          }).toList();

          if (filteredDocs.isEmpty) {
            return const Center(child: Text('No hay publicaciones'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              final doc = filteredDocs[index];
              final data = doc.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    final usuario = data['usuario'] ?? 'Sin título';
                    final mensaje = data['mensaje'] ?? 'Sin descripción';


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetallesScreen(
                          usuario: usuario,
                          mensaje: mensaje,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      data['usuario'] ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(data['mensaje'] ?? ''),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (value) {
                        if (value == 'editar') {
                          _editPublication(context, doc.id, data);
                        } else if (value == 'eliminar') {
                          _deletePublication(context, doc.id);
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'editar',
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem(
                          value: 'eliminar',
                          child: Text('Eliminar'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
     
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.primaryContainer,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.groups, color: Colors.white),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFB4E6FF)),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Color(0xFFB4E6FF)),
            label: 'Perfil',
          ),
        ],
),

    );
  }


}

