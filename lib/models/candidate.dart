class Candidate {
  //atributos
  String name;
  String document;
  String email;
  String course;
  int graduationYear;
  bool available;
  List<String> technicalSkills;

  //construtor
  Candidate({
    required this.name,
    required this.document,
    required this.email,
    required this.course,
    required this.graduationYear,
    required this.available,
    required this.technicalSkills,
  });

  static List<Candidate> candidates() {
    return [
      Candidate(
        name: "Pedro Silva",
        document: "1234567890",
        email: "pedro.silva@ma.senac.br",
        course: "Técnico Em Informática para Internet",
        graduationYear: 2026,
        available: true,
        technicalSkills: ["HTML", "CSS", "Javascript", "PHP", "IA"],
      ),

      Candidate(
        name: "Elcio Reis",
        document: "1234567890",
        email: "elcio.reis@ma.senac.br",
        course: "Técnico Em Informática para Internet",
        graduationYear: 2026,
        available: true,
        technicalSkills: [
          "HTML",
          "TAILWINDCSS",
          "JAVASCRIPT",
          "TYPESCRIPT",
          "PHP",
          "REACT",
          "NEXT.JS",
          "NODE.JS",
          "MYSQL",
          "MONGODB",
          "DEPLOY",
        ],
      ),

      Candidate(
        name: "Joao pedro",
        document: "01254125898",
        email: "joaopedro@gmail.com",
        course: "Tec. em inf para internet",
        graduationYear: 2026,
        available: false,
        technicalSkills: ["HTML", "CSS", "JavaScript", "Java", "PHP", "IA"],
      ),

      Candidate(
        name: "Francisco Kassio",
        document: "123456789",
        email: "franciscokassio@example.com",
        course: "Tecnico em Informatica para Internet",
        graduationYear: 2026,
        available: false,
        technicalSkills: [
          "PHP",
          "HTML",
          "CSS",
          "Javascript",
          "Flutter",
          "Dart",
        ],
      ),

      Candidate(
        name: "Nayra",
        document: "1234567890",
        email: "nayra.conceicao@gmail.com",
        course: "Técnico em Informática para internet",
        available: true,
        graduationYear: 2026,
        technicalSkills: [
          "HTML",
          "CSS",
          "Javascript",
          "PHP",
          "IA",
          "Informática básica",
          "Recepção",
        ],
      ),

      Candidate(
        name: "Náyla Gabrielle",
        document: "1234567890",
        email: "nayla.gabrielle@ma.senac.br",
        course: "Técnico em Informática para Internet",
        graduationYear: 2026,
        available: true,
        technicalSkills: ["HTML", "CSS", "JAVASCRIPT", "PHP"],
      ),

      Candidate(
        name: "Ezequiel Santos",
        document: "1234567890",
        email: "ezequiel25@gmail.com",
        course: "Técnico em Informática para Internet",
        graduationYear: 2026,
        available: false,
        technicalSkills: ["HTML", "CSS", "Javascript", "Recursos Humanos"],
      ),
    ];
  }
}
