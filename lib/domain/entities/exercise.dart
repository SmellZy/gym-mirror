class Exercise {
  final String name;
  final String description;
  final int repetitions;
  final int sets;
  final int restTime;

  Exercise(
    {
      required this.name, 
      required this.description, 
      required this.repetitions, 
      required this.sets, 
      required this.restTime
    }
  );
}