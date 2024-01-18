import 'package:bfsi/blocs/admin_landing/admin_landing_bloc.dart';
import 'package:bfsi/blocs/app_state_bloc.dart';
import 'package:bfsi/core/consts/asset_images.dart';
import 'package:bfsi/core/consts/bfsi_colors.dart';
import 'package:bfsi/presentation/views/components/bfsi_background_box.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class AdminLandingView extends StatelessWidget {
  const AdminLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminLandingBloc, AdminLandingState>(
      builder: (context, state) {
        if (state is AdminLandingOnLoadState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFF010101),
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(
                'Customer Request',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    right: 16.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<AppStateBloc>(context).add(
                        const LogOutEvent(),
                      );
                    },
                    child: Image.asset(
                      AssetImages.signOut,
                    ),
                  ),
                ),
              ],
            ),
            body: BfsiBackgroundBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 30.0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (final BuildContext context, final int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: BfsiColors.boxColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '23 May 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Customer ID : ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                              Text(
                                                '9999999999',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              'Description : ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Routemaster.of(context).push(
                                            '${InitialPageRoutes.adminLandingPage}/${RelativePageRoutes.requestApproveReject}',
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: BfsiColors
                                              .raiseRequestButtonColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: Text(
                                          'View',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 20.0,
                                ),
                                child: Text(
                                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, ...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
