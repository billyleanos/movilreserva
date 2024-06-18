import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? _selectedArea = 'Finanzas'; // Valor predeterminado para área
String? _selectedSala = 'Sala A'; // Valor predeterminado para sala

class NuevaReservaPage extends StatefulWidget {
  const NuevaReservaPage({Key? key}) : super(key: key);

  @override
  State<NuevaReservaPage> createState() => _NuevaReservaPageState();
}

class _NuevaReservaPageState extends State<NuevaReservaPage> {
  String? _solicitante;
  final _formKey = GlobalKey<FormState>();
  final _fechaController = TextEditingController();
  final _horaInicioController = TextEditingController(text: '10:00 AM');
  final _horaFinController = TextEditingController(text: '11:30 AM');
  final _salaController = TextEditingController();
  final _areaController = TextEditingController();
  final _eventoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSolicitante();
  }

  Future<void> _loadSolicitante() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _solicitante = prefs.getString('usuario');
    });
  }

  @override
  void dispose() {
    _fechaController.dispose();
    _horaInicioController.dispose();
    _horaFinController.dispose();
    _salaController.dispose();
    _areaController.dispose();
    _eventoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Reserva'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Solicitante: $_solicitante',
                    style: const TextStyle(fontSize: 18.0)),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _fechaController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha',
                    hintText: 'Ingrese la fecha',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la fecha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _horaInicioController,
                  decoration: const InputDecoration(
                    labelText: 'Hora Inicio',
                    hintText: 'Ingrese la hora de inicio',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                    );
                    if (time != null) {
                      setState(() {
                        _horaInicioController.text =
                            '${time.hour}:${time.minute} AM';
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _horaFinController,
                  decoration: const InputDecoration(
                    labelText: 'Hora Fin',
                    hintText: 'Ingrese la hora de fin',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                    );
                    if (time != null) {
                      setState(() {
                        _horaFinController.text =
                            '${time.hour}:${time.minute} AM';
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButton<String>(
                  value: _selectedArea,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedArea = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Finanzas',
                      child: Text('Finanzas'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Contabilidad',
                      child: Text('Contabilidad'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Gerencia',
                      child: Text('Gerencia'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Marketing',
                      child: Text('Marketing'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                DropdownButton<String>(
                  value: _selectedSala,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSala = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Sala A',
                      child: Text('Sala A'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Sala B',
                      child: Text('Sala B'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _eventoController,
                  decoration: const InputDecoration(
                    labelText: 'Evento',
                    hintText: 'Ingrese el evento',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el evento';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aquí puedes guardar la reserva usando los valores seleccionados
                      // Ejemplo de cómo acceder a los valores seleccionados:
                      // _selectedArea, _selectedSala, _fechaController.text, etc.
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
