import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admin_landing_event.dart';
part 'admin_landing_state.dart';

class AdminLandingBloc extends Bloc<AdminLandingEvent, AdminLandingState> {
  AdminLandingBloc() : super(AdminLandingInitial()) {
    on<AdminLandingOnLoadEvent>(_onLoadAdminLanding);
  }

  FutureOr<void> _onLoadAdminLanding(
      AdminLandingOnLoadEvent event, Emitter<AdminLandingState> emit) {
    emit(
      const AdminLandingOnLoadState(),
    );
  }
}
