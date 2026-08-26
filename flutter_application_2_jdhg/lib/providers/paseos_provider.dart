import '../models/paseador_model.dart';
import '../models/paseo_model.dart';

class PaseosDatosBase {
  static List<Paseador> listaPaseadores = [
    Paseador(
      id: '1',
      nombre: 'Carlos Mendoza',
      precioPorHora: 15.00,
      telefono: '+593987654321',
      experiencia: '3 años cuidando razas grandes y enérgicas.',
      calificacion: 4.9,
      fotoUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      especialidades: ['Razas Grandes', 'Entrenamiento Básico'],
    ),
    Paseador(
      id: '2',
      nombre: 'María Elena Torres',
      precioPorHora: 12.50,
      telefono: '+593991234567',
      experiencia: 'Especialista en cachorros y perros senior.',
      calificacion: 4.8,
      fotoUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      especialidades: ['Cachorros', 'Paseos Lentos / Senior'],
    ),
    Paseador(
      id: '3',
      nombre: 'Javier Ramírez',
      precioPorHora: 18.00,
      telefono: '+593988887766',
      experiencia: 'Paseador certificado y paramédico veterinario.',
      calificacion: 5.0,
      fotoUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
      especialidades: ['Primeros Auxilios', 'Paseos Grupales'],
    ),
    Paseador(
      id: '4',
      nombre: 'Andrea Gómez',
      precioPorHora: 14.00,
      telefono: '+593976543210',
      experiencia: 'Apasionada por los animales y comportamiento canino.',
      calificacion: 4.7,
      fotoUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      especialidades: ['Socialización', 'Razas Medianas'],
    ),
  ];

  static List<Paseo> misPaseos = [];
}