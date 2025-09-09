import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superficies con bordes redondeados',
      home: Scaffold(
        appBar: AppBar(
          
          title: const Text('Tu red     Inspiración', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: const Color.fromARGB(255, 255, 243, 226),
        ),

        
        


        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),

          child: Column(

            children: [

              const SizedBox(height: 8),

              Row(
              children: [

                Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Tortilla de lentejas y cebolla',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

              Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Cupcake Cheesecake Kinder',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

                
              ],
            ),



            const SizedBox(height: 8),
              
              Row(
              children: [

                Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Flan casero',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

              Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Cupcake Cheesecake Kinder',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

                
              ],
            ),



            const SizedBox(height: 8),
              
              Row(
              children: [

                Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Cupcake Cheesecake Kinder',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

              Expanded(
                  child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 197, 197, 197),
                    width: double.infinity,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Cookei',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Cupcake Cheesecake Kinder',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                    child: Text(
                      'Hace 9 horas',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('😋'),
                          ),
                        ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('❤️'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción cuando se presiona el botón
                            },
                            child: const Text('👏'),
                          ),
                      ],
                    ),

                        ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
           ),

                
              ],
            ),




            ], //Children columna
          ),
        ),
      ),
    );
  }
}
