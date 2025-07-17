import 'package:equatable/equatable.dart';

sealed class BlockEvent extends Equatable {
  const BlockEvent();

  @override
  List<Object> get props => [];
}

//-----------------------------Fav Event-----------------------------
final class BlockUserAdded extends BlockEvent {
  final String blockId;
  BlockUserAdded({required this.blockId});
  @override
  List<Object> get props => [blockId];
}

final class BlockUserRemoved extends BlockEvent {
  final String blockId;
  BlockUserRemoved({required this.blockId});
  @override
  List<Object> get props => [blockId];
}

final class BlockUsersFetched extends BlockEvent {}
