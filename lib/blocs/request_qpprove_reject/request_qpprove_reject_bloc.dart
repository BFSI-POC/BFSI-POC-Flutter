import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_approve_reject_event.dart';
part 'request_approve_reject_state.dart';

class RequestApproveRejectBloc
    extends Bloc<RequestApproveRejectEvent, RequestApproveRejectState> {
  RequestApproveRejectBloc() : super(RequestApproveRejectInitial()) {
    on<RequestApproveRejectOnLoadEvent>(_onLoadRequestApproveReject);
  }

  FutureOr<void> _onLoadRequestApproveReject(
      RequestApproveRejectOnLoadEvent event,
      Emitter<RequestApproveRejectState> emit) {
    emit(
      const RequestApproveRejectOnLoadState(),
    );
  }
}
