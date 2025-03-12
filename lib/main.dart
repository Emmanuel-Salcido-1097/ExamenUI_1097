import 'package:flutter/material.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(MiExamen()); // Ejecuta la aplicación
}

// Clase principal de la aplicación
class MiExamen extends StatelessWidget {
  const MiExamen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de depuración
      home: SucursalesScreen(), // Define la pantalla principal
    );
  }
}

// Modelo de datos para una sucursal
class Sucursal {
  final int id;
  final String nombre;
  final String ubicacion;
  final String tamano;

  Sucursal({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.tamano,
  });
}

// Pantalla principal que muestra la lista de sucursales
// ignore: use_key_in_widget_constructors
class SucursalesScreen extends StatelessWidget {
  // Lista de sucursales con datos predefinidos
  final List<Sucursal> sucursales = [
    Sucursal(id: 1, nombre: "Sucursal Centro", ubicacion: "Calle 1, Centro", tamano: "Grande"),
    Sucursal(id: 2, nombre: "Sucursal Norte", ubicacion: "Avenida 5, Norte", tamano: "Mediano"),
    Sucursal(id: 3, nombre: "Sucursal Sur", ubicacion: "Calle 12, Sur", tamano: "Pequeño"),
    Sucursal(id: 4, nombre: "Sucursal Este", ubicacion: "Carrera 7, Este", tamano: "Grande"),
    Sucursal(id: 5, nombre: "Sucursal Oeste", ubicacion: "Avenida 9, Oeste", tamano: "Mediano"),
  ];

  // Lista de colores para cada sucursal
  final List<Color> colors = [
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Emmanuel Salcido Mat:22308051281097",
            style: TextStyle(color: Colors.white), // Texto en blanco
          ),
        ),
        backgroundColor: Colors.blue, // Color de fondo azul
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margen externo para la lista
        child: ListView.separated(
          itemCount: sucursales.length, // Número de elementos en la lista
          separatorBuilder: (context, index) => SizedBox(height: 10), // Espaciador entre tarjetas
          itemBuilder: (context, index) {
            final sucursal = sucursales[index]; // Obtiene la sucursal actual
            return _buildSucursalCard(sucursal, colors[index]); // Construye la tarjeta
          },
        ),
      ),
    );
  }

  // Método para construir el diseño de cada tarjeta de sucursal
  Widget _buildSucursalCard(Sucursal sucursal, Color color) {
    return Container(
      padding: EdgeInsets.all(16), // Espaciado interno de la tarjeta
      decoration: BoxDecoration(
        color: color, // Color de fondo
        borderRadius: BorderRadius.circular(15), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Color de la sombra
            blurRadius: 5, // Desenfoque de la sombra
            offset: Offset(2, 2), // Desplazamiento de la sombra
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido a la izquierda
        children: [
          Text("ID: ${sucursal.id}", style: TextStyle(fontWeight: FontWeight.bold)), // Muestra el ID en negrita
          Text("Nombre: ${sucursal.nombre}"), // Muestra el nombre
          Text("Ubicación: ${sucursal.ubicacion}"), // Muestra la ubicación
          Text("Tamaño: ${sucursal.tamano}"), // Muestra el tamaño
        ],
      ),
    );
  }
}
