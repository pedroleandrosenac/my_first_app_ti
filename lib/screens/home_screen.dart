import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/candidate.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  List<Candidate> candidates = Candidate.candidates();

  String? colorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Lista de candidatos"),
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          final candidate = candidates[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text(candidate.name[0])),

                    title: Text(candidate.name),

                    subtitle: Text(candidate.email),

                    trailing: Icon(
                      candidate.available
                          ? Icons.check_circle
                          : Icons.cancel_rounded,
                      color: candidate.available ? Colors.green : Colors.red,
                    ),
                  ),

                  const Text(
                    "Habilidades Técnicas",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontFamily: 'Roboto Mono',
                    ),
                  ),

                  Wrap(
                    spacing: 6,
                    runSpacing: 4,

                    children: candidate.technicalSkills.map((skill) {
                      return Chip(
                        label: Text(
                          skill,

                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        backgroundColor: Colors.blue,

                        padding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.push(AppRoutes.createCandidate);
        },
        tooltip: "Criar Candidato",
        child: const Icon(Icons.person_add),
      ),

    );
  }
}
