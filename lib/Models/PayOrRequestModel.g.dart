// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayOrRequestModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PayAmountAdapter extends TypeAdapter<PayAmount> {
  @override
  final int typeId = 0;

  @override
  PayAmount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PayAmount(
      amount: fields[0] as String,
      status: fields[1] as String,
      date: fields[2] as DateTime,
      userName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PayAmount obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
