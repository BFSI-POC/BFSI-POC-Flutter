part of 'request_qpprove_reject_bloc.dart';

abstract class RequestApproveRejectState extends Equatable {
  const RequestApproveRejectState();
}

class RequestApproveRejectInitial extends RequestApproveRejectState {
  @override
  List<Object> get props => [];
}

class RequestApproveRejectOnLoadState extends RequestApproveRejectState {
  const RequestApproveRejectOnLoadState();

  @override
  List<Object> get props => [];

  RequestApproveRejectOnLoadState copyWith() {
    return const RequestApproveRejectOnLoadState();
  }
}
