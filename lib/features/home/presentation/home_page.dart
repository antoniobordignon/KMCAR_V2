import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kmcar/common/constants/routes.dart';
import 'package:kmcar/common/constants/text_style.dart';
import 'package:kmcar/common/widgets/add_button.dart';
import 'package:kmcar/common/widgets/show_card.dart';
import 'package:kmcar/features/add_info/data/orm/model.dart';
import 'package:kmcar/features/add_info/presentation/add_info_page.dart';
import 'package:kmcar/main.dart';
import 'package:provider/provider.dart';

class TripNotifier extends ChangeNotifier {
  final AppDb _db;

  TripNotifier(this._db);

  List<Trip> _trips = [];

  List<Trip> get trips => _trips;

  Future<void> loadTrips() async {
    try {
      List<Trip> trips = await _db.getTrips();
      _trips = trips;
      log('here');
      notifyListeners();
    } catch (e) {
      _trips = [];
      log('Error loading trips: $e');
      notifyListeners();
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late TripNotifier _tripNotifier;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) async {
      await _tripNotifier.loadTrips();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _tripNotifier.loadTrips();
              },
              icon: const Icon(Icons.refresh))
        ],
        title: Text(
          'KMCar',
          style: AppTextStyle.bigText.copyWith(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
          create: (context) => TripNotifier(db),
          builder: (BuildContext context, Widget? child) {
            _tripNotifier = context.watch<TripNotifier>();
            return ListView.builder(
              itemCount: _tripNotifier._trips.length,
              itemBuilder: (context, index) {
                final trip = _tripNotifier._trips[index];
                return Column(children: [
                  const SizedBox(height: 2.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 7.0),
                    child: ShowCard(
                      trip: trip,
                    ),
                  ),
                ]);
              },
            );
          }),
      // Botão para adicionar novos registros usado bottomNavigationBar para que fique sempre no final da tela.
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: AddButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: _tripNotifier,
                    builder: (context, child) => const AddInfoPage()),
              )),
          text: "Adicionar registro",
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
