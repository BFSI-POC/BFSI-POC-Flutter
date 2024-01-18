part of 'request_qpprove_reject_bloc.dart';

abstract class RequestApproveRejectEvent extends Equatable {
  const RequestApproveRejectEvent();

  @override
  List<Object?> get props => [];
}

class RequestApproveRejectOnLoadEvent extends RequestApproveRejectEvent {
  const RequestApproveRejectOnLoadEvent();
}
