import 'package:bfsi/blocs/request_qpprove_reject/request_qpprove_reject_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/request_approve_reject/request_approve_reject_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestApproveRejectPage extends BfsiPage<void> {
  RequestApproveRejectPage({
    super.keyValue = RelativePageRoutes.requestApproveReject,
    super.routeName = RelativePageRoutes.requestApproveReject,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<RequestApproveRejectBloc>(
          create: (context) => RequestApproveRejectBloc()
            ..add(
              const RequestApproveRejectOnLoadEvent(),
            ),
          child: const RequestApproveRejectView(),
        );
      },
    );
  }
}
