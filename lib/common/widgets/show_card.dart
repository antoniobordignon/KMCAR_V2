import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kmcar/common/constants/routes.dart';
import 'package:kmcar/features/add_info/data/orm/model.dart';
import 'package:kmcar/main.dart';

class ShowCard extends StatelessWidget {
  final Trip trip;

  const ShowCard({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Quando segurar precionado ira executar função para deletar registro, solictando se o usuário realmente quer deletar.
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: 'DeleteImagemDialog',
          pageBuilder: (context, animation, secondaryAnimation) {
            return Container();
          },
          transitionBuilder: (context, a1, a2, child) {
            return AlertDialog(
              title: const Text("Atenção"),
              content: const Text("Você realmente quer deletar o registro?"),
              actions: [
                TextButton(
                  child: const Text("Não"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FilledButton(
                  child: const Text("sim"),
                  onPressed: () async {
                    await db.deleteTrip(trip.id);
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(
                        context,
                        NamedRoute.home,
                      );
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      onTap: () {
        // Quando clicado ira trazer a imagem com a quilometragem.
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: 'exibirImagemDialog',
          pageBuilder: (context, animation, secondaryAnimation) {
            return Container();
          },
          transitionBuilder: (context, a1, a2, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                child: AlertDialog(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  content: SizedBox(
                    width: 1280,
                    height: 800 * 0.7,
                    child: trip.imagePath!.isNotEmpty
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(File(trip.imagePath!)),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${trip.kilometragem.toStringAsFixed(3)} KM',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Text('Sem imagem disponível'),
                  ),
                ),
              ),
            );
          },
        );
      },
      // Card passando informações de viagens.
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    Text(
                        'Quilometragem: ${trip.kilometragem.toStringAsFixed(3)}'),
                    const SizedBox(height: 5.0),
                    Text('Motorista: ${trip.motorista}'),
                    const SizedBox(height: 5.0),
                    Text('Destino: ${trip.destino}'),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
              trip.imagePath!.isNotEmpty
                  ? Image.file(
                      File(trip.imagePath!),
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : const Text('Sem imagem disponível'),
            ],
          ),
        ),
      ),
    );
  }
}
