class Exercise {
  final int id;
  final String name;
  final String description;
  final int repetitions;
  final int sets;
  final int restTime;
  final String modelPath;

  Exercise(
    {
      required this.id,
      required this.name, 
      required this.description, 
      required this.repetitions, 
      required this.sets, 
      required this.restTime,
      required this.modelPath
    }
  );
}