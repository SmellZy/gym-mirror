// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_workout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinishedWorkoutModelAdapter extends TypeAdapter<FinishedWorkoutModel> {
  @override
  final int typeId = 3;

  @override
  FinishedWorkoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinishedWorkoutModel(
      id: fields[0] as int,
      workout: fields[1] as WorkoutModel,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FinishedWorkoutModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.workout)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinishedWorkoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
