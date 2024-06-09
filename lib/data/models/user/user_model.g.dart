// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int,
      name: fields[1] as String?,
      birthday: fields[2] as DateTime?,
      height: fields[3] as int?,
      initialWeight: fields[4] as int?,
      currentWeight: fields[5] as int?,
      goalWeight: fields[6] as int?,
      dayStreak: fields[7] as int?,
      workoutHistory: (fields[8] as List?)?.cast<FinishedWorkoutModel>(),
      fitnessLevel: fields[9] as FitnessLevel?,
      weigthHistory: (fields[10] as List?)?.cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.initialWeight)
      ..writeByte(5)
      ..write(obj.currentWeight)
      ..writeByte(6)
      ..write(obj.goalWeight)
      ..writeByte(7)
      ..write(obj.dayStreak)
      ..writeByte(8)
      ..write(obj.workoutHistory)
      ..writeByte(9)
      ..write(obj.fitnessLevel)
      ..writeByte(10)
      ..write(obj.weigthHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
