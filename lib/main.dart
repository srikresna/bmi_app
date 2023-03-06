import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double currentSliderValue = 183.0;
  int weight = 74;
  int heigth = 19;

  bool isMale = true;

  void incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void changeMale() {
    setState(() {
      isMale = true;
    });
  }

  void changeFemale() {
    setState(() {
      isMale = false;
    });
  }

  void incrementHeigth() {
    setState(() {
      heigth++;
    });
  }

  void decrementWeight() {
    setState(() {
      weight--;
    });
  }

  void decrementHeigth() {
    setState(() {
      heigth--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 19, 53),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text('BMI CALCULATOR', style: TextStyle(fontSize: 14)),
        backgroundColor: const Color.fromARGB(255, 16, 22, 57),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: !isMale ? const Color.fromARGB(255, 40, 44, 79) : Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: TextButton(
                  onPressed: () {
                    changeMale();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.male, size: 65, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        'MALE',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isMale ? const Color.fromARGB(255, 40, 44, 79) : Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    changeFemale();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.female, size: 65, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        'FEMALE',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9 + 10,
                height: MediaQuery.of(context).size.height * 0.27,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 26, 60),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${currentSliderValue.toInt()}',
                            style: const TextStyle(
                                fontSize: 48,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('cm',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 216, 216, 216),
                                )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 0.5,
                        thumbColor: Colors.pink,
                        overlayColor: Color.fromARGB(100, 252, 4, 86),
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 13,
                        ),
                      ),
                      child: Slider(
                        value: currentSliderValue,
                        max: 300,
                        divisions: 300,
                        inactiveColor: Colors.white,
                        onChanged: (double value) {
                          setState(() {
                            currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.26,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 26, 60),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      'WEIGHT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                    Text(
                      weight.toString(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 33, 39, 71),
                          child: IconButton(
                            onPressed: decrementWeight,
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                            splashRadius: 10,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 33, 39, 71),
                          child: IconButton(
                            onPressed: incrementWeight,
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            splashRadius: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.26,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 26, 60),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                    Text(
                      heigth.toString(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 33, 39, 71),
                          child: IconButton(
                            onPressed: decrementHeigth,
                            icon: const Icon(Icons.remove),
                            color: Colors.white,
                            splashRadius: 10,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 33, 39, 71),
                          child: IconButton(
                            onPressed: incrementHeigth,
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                            splashRadius: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {},
            child: Container(
              constraints: const BoxConstraints(
                minHeight: kToolbarHeight,
              ),
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'CALCULATE YOUR BMI',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
