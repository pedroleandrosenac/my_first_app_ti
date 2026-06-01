import 'package:flutter/material.dart';

import '../models/candidate.dart';

class CreateCandidateScreen extends StatefulWidget {
  const CreateCandidateScreen({super.key});

  @override
  State<CreateCandidateScreen> createState() =>
      _CreateCandidateScreenState();
}

class _CreateCandidateScreenState extends State<CreateCandidateScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
  TextEditingController();

  final TextEditingController _documentController =
  TextEditingController();

  final TextEditingController _emailController =
  TextEditingController();

  final TextEditingController _courseController =
  TextEditingController();

  final TextEditingController _graduationYearController =
  TextEditingController();

  final TextEditingController _skillController =
  TextEditingController();

  bool _available = true;

  final List<String> _technicalSkills = [];

  @override
  void dispose() {
    _nameController.dispose();
    _documentController.dispose();
    _emailController.dispose();
    _courseController.dispose();
    _graduationYearController.dispose();
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill() {
    final skill = _skillController.text.trim();

    if (skill.isEmpty) return;

    setState(() {
      _technicalSkills.add(skill);
      _skillController.clear();
    });
  }

  void _saveCandidate() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_technicalSkills.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Adicione pelo menos uma habilidade técnica.",
          ),
        ),
      );
      return;
    }

    final candidate = Candidate(
      name: _nameController.text.trim(),
      document: _documentController.text.trim(),
      email: _emailController.text.trim(),
      course: _courseController.text.trim(),
      graduationYear: int.parse(
        _graduationYearController.text.trim(),
      ),
      available: _available,
      technicalSkills: _technicalSkills,
    );

    print(candidate.name);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Candidato cadastrado com sucesso!"),
      ),
    );

    Navigator.pop(context, candidate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Candidato"),
        backgroundColor:
        Theme.of(context).colorScheme.inversePrimary,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Card(
          elevation: 2,

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  const Text(
                    "Dados do Candidato",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nameController,

                    decoration: const InputDecoration(
                      labelText: "Nome Completo",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Informe o nome.";
                      }

                      if (value.trim().length < 3) {
                        return "Nome inválido.";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _documentController,

                    keyboardType: TextInputType.number,

                    decoration: const InputDecoration(
                      labelText: "CPF",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.badge),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Informe o CPF.";
                      }

                      if (value.trim().length < 11) {
                        return "CPF inválido.";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _emailController,

                    keyboardType:
                    TextInputType.emailAddress,

                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Informe o e-mail.";
                      }

                      if (!value.contains("@")) {
                        return "E-mail inválido.";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _courseController,

                    decoration: const InputDecoration(
                      labelText: "Curso",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.school),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Informe o curso.";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller:
                    _graduationYearController,

                    keyboardType: TextInputType.number,

                    decoration: const InputDecoration(
                      labelText: "Ano de Conclusão",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),

                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return "Informe o ano.";
                      }

                      final year =
                      int.tryParse(value.trim());

                      if (year == null) {
                        return "Ano inválido.";
                      }

                      if (year < 2000 ||
                          year > 2100) {
                        return "Ano inválido.";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  SwitchListTile(
                    title:
                    const Text("Disponível para contratação"),
                    value: _available,

                    onChanged: (value) {
                      setState(() {
                        _available = value;
                      });
                    },
                  ),

                  const Divider(),

                  const Text(
                    "Habilidades Técnicas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _skillController,

                          decoration:
                          const InputDecoration(
                            labelText:
                            "Adicionar habilidade",
                            border:
                            OutlineInputBorder(),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      IconButton(
                        onPressed: _addSkill,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children: _technicalSkills
                        .map(
                          (skill) => Chip(
                        label: Text(skill),

                        deleteIcon:
                        const Icon(Icons.close),

                        onDeleted: () {
                          setState(() {
                            _technicalSkills
                                .remove(skill);
                          });
                        },
                      ),
                    )
                        .toList(),
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton.icon(
                    onPressed: _saveCandidate,

                    icon: const Icon(Icons.save),

                    label: const Text(
                      "Cadastrar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}