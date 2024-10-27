import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers/tic_tac_toe_provider.dart';

void main() {
  runApp(const MyApp());
}

//yarab tkon fhmt al code.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        child: const TicTacToePage(),
        create: (context) => TicTacToeProvider(),
      ),
    );
  }
}

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Column(
        children: [
          Consumer(
            builder: (context, TicTacToeProvider provider, child) => Expanded(
                child: Text(
              'win: ${provider.winnerPlayer}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.blue),
            )),
          ),
          Expanded(
            flex: 8,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) => Consumer<TicTacToeProvider>(
                builder: (context, TicTacToeProvider provider, child) =>
                    Container(
                  color: Colors.green,
                  width: 250,
                  height: 250,
                  child: InkWell(
                    //al InkWell zy al GestureDetector bezabt bs alfr2 an GestureDetector mashaklha kter w haga mo2refa, laken deh a7san w mafhash mashakel
                    onTap: () {
                      provider.turn(index);
                      provider.win();
                    },
                    child: Center(
                        child: Text(
                      provider.list[index],
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                ),
              ),
              itemCount: 9,
            ),
          ),
          Expanded(
            flex: 2,
            child: Consumer(
              builder: (context, TicTacToeProvider provider, child) =>
                  ElevatedButton(
                      onPressed: () {
                        provider.reset();
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
