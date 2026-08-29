
# 🐾 Descripción breve de la aplicación

PaseoCanino es una aplicación móvil desarrollada en Flutter orientada a la gestión y solicitud de servicios de paseo para mascotas. La plataforma conecta a dueños de perros con paseadores verificados, permitiéndoles explorar perfiles, revisar tarifas y calificaciones, filtrar paseadores según sus preferencias, realizar llamadas de contacto directo y programar reservas en tiempo real.

## 📌 Indicar si continuó la aplicación de la Actividad Integradora 1 o desarrolló una nueva.

Para esta entrega se continuó con el desarrollo de la aplicación de la Actividad Integradora 1. Se realizó una refactorización integral del código inicial (reestructurando la arquitectura monolítica hacia un patrón modular limpio) e integrando nuevas pantallas, modelos de datos, componentes interactivos y servicios externos.

## ⚡ Descripción de las nuevas funcionalidades implementadas.

Navegación Multipantalla: Transición fluida entre cuatro vistas principales del sistema.

Sistema de Filtro por Favoritos: Capacidad de marcar/desmarcar paseadores preferidos y filtrar la lista en tiempo real.

Perfil de Paseador Ampliado: Visualización de detalles, biografía, áreas de especialidad y fotografía circular.

Integración de Llamadas Nativas: Lanzamiento de la app de teléfono del dispositivo al presionar el botón de contacto.

Formulario Modal de Reserva: Ventana emergente (ModalBottomSheet) para elegir nombre de la mascota, fecha, hora y duración del servicio.

Cálculo de Tarifas Automático: Recálculo en tiempo real del costo total en función del tiempo de paseo seleccionado.

Historial de Reservas Activas: Registro visual de los paseos agendados con opción de consulta detallada.

BUSCAR PASEADORES

![alt text](image-1.png)

RESERVA DE PASEADOR

![alt text](image-11.png)

ESTADISTICAS DE PASEOS

![alt text](image-5.png)

## 📌 Listado de las cuatro pantallas desarrolladas y su función

* **`HomeScreen` (`lib/screens/home_screen.dart`):** Dashboard principal con encabezado en gradiente, logotipo, métricas en tiempo real de paseadores/reservas y menú de acceso en cuadrícula.
* **`PaseadoresScreen` (`lib/screens/paseadores_screen.dart`):** Catálogo de paseadores renderizado en `ListView` con fotos circulares, puntuaciones y filtro de favoritos con `setState()`.
* **`DetallePaseadorScreen` (`lib/screens/detalle_paseador_screen.dart`):** Vista de perfil individual con experiencia, especialidades, botón de llamada telefónica y modal flotante para configurar la reserva.
* **`MisPaseosScreen` (`lib/screens/mis_paseos_screen.dart`):** Pantalla de historial que muestra las reservas generadas con su costo total, mascota, fecha y foto del paseador asignado.

PANTALLA 1
Buscar Paseadores:
![alt text](image-2.png)

PANTALLA 2
Seleccion del Paseador
![alt text](image-6.png)

PANTALLA 3
Historial de Paseos
![alt text](image-4.png)

![alt text](image-8.png)

PANTALLA 4

Confirmacion de Seleccion de Paseador

![alt text](image-7.png)
## 📌	Widgets nuevos utilizados en el proyecto.

ListView.builder: Renderizado eficiente de listas dinámicas (catálogo de paseadores e historial).

GridView.count: Organización en cuadrícula para las opciones de menú en el Home.

ListTile: Maquetación estándar de filas con avatar, título, subtítulo y elementos finales (trailing).

CircleAvatar / ClipRRect: Modelado circular para las fotos de perfil de los paseadores y el isotipo de la app.

Image.network: Carga de imágenes remotas con control de estado de carga y soporte de error.

Divider: Separadores de línea para organizar secciones visuales.

Chip / ChoiceChip: Etiquetas visuales para mostrar especialidades y botones de selección de horario.

OutlinedButton: Botón con borde para acciones secundarias como llamadas telefónicas.

## 📌   Descripción de las interacciones implementadas.

## 📌   Explicación de la funcionalidad desarrollada mediante setState().

## 📌   Nombre del paquete externo utilizado y explicación de para qué se utilizó,

## 📌   Evidencia de la personalización realizada: nombre, ícono, logotipo y colores.
## 📌   Capturas de pantalla de las principales pantallas de la aplicación.
## 📌   Instrucciones básicas para ejecutar el proyecto.


