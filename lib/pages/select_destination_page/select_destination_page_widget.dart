import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_destination_page_model.dart';
export 'select_destination_page_model.dart';

class SelectDestinationPageWidget extends StatefulWidget {
  const SelectDestinationPageWidget({Key? key}) : super(key: key);

  @override
  _SelectDestinationPageWidgetState createState() =>
      _SelectDestinationPageWidgetState();
}

class _SelectDestinationPageWidgetState
    extends State<SelectDestinationPageWidget> {
  late SelectDestinationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDestinationPageModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: FlutterFlowPlacePicker(
            iOSGoogleMapsApiKey: 'AIzaSyCbdKXi_HrYe8Ek6DfP5PoUBaEC4heUlio',
            androidGoogleMapsApiKey: 'AIzaSyAHFQ5nY3lsNJSiYEaFOkABODd2ovEtYsE',
            webGoogleMapsApiKey: 'AIzaSyAtj0vRr2DzWQN4pjxEkkJUn7V5swv6oBw',
            onSelect: (place) async {
              setState(() => _model.placePickerValue = place);
            },
            defaultText: 'Select Location',
            icon: Icon(
              Icons.place,
              color: FlutterFlowTheme.of(context).info,
              size: 16.0,
            ),
            buttonOptions: FFButtonOptions(
              width: 200.0,
              height: 40.0,
              color: FlutterFlowTheme.of(context).primaryText,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('login', context.mounted);
                },
                child: Icon(
                  Icons.logout,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                desktop: false,
              ))
                Expanded(
                  child: FlutterFlowGoogleMap(
                    controller: _model.googleMappsController,
                    onCameraIdle: (latLng) => _model.googleMappsCenter = latLng,
                    initialLocation: _model.googleMappsCenter ??=
                        currentUserLocationValue!,
                    markerColor: GoogleMarkerColor.blue,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 14.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: true,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.placePickerValue.address != null &&
                        _model.placePickerValue.address != '')
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.electric_car_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 40.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Combustible',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                  Text(
                                    '16.8',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Cash',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 40.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));

                        var viajeRecordReference = ViajeRecord.collection.doc();
                        await viajeRecordReference.set(createViajeRecordData(
                          isDriverAssigne: false,
                          userLocation: currentUserLocationValue,
                          userUid: currentUserUid,
                          destinationLocation: _model.placePickerValue.latLng,
                          destinationAddress: _model.placePickerValue.address,
                          userName: currentUserDisplayName,
                        ));
                        _model.rideDetails = ViajeRecord.getDocumentFromData(
                            createViajeRecordData(
                              isDriverAssigne: false,
                              userLocation: currentUserLocationValue,
                              userUid: currentUserUid,
                              destinationLocation:
                                  _model.placePickerValue.latLng,
                              destinationAddress:
                                  _model.placePickerValue.address,
                              userName: currentUserDisplayName,
                            ),
                            viajeRecordReference);

                        context.pushNamed(
                          'findingRidePage',
                          queryParameters: {
                            'rideDeyailsReference': serializeParam(
                              _model.rideDetails?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Donde Voy',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
