import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'finding_ride_page_model.dart';
export 'finding_ride_page_model.dart';

class FindingRidePageWidget extends StatefulWidget {
  const FindingRidePageWidget({
    Key? key,
    required this.rideDeyailsReference,
  }) : super(key: key);

  final DocumentReference? rideDeyailsReference;

  @override
  _FindingRidePageWidgetState createState() => _FindingRidePageWidgetState();
}

class _FindingRidePageWidgetState extends State<FindingRidePageWidget> {
  late FindingRidePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindingRidePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ViajeRecord>(
      stream: ViajeRecord.getDocument(widget.rideDeyailsReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        final findingRidePageViajeRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Destino',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFF6F9FB),
                          ),
                    ),
                    Text(
                      findingRidePageViajeRecord.destinationAddress,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFF6F9FB),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!findingRidePageViajeRecord.isDriverAssigne)
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
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
                                Expanded(
                                  child: Text(
                                    'Buscando Abastecedor',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                  ),
                                ),
                                Lottie.network(
                                  'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
                                  width: 30.0,
                                  height: 30.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!findingRidePageViajeRecord.isDriverAssigne)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RouteViewStatic(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: Colors.black,
                          startAddress: findingRidePageViajeRecord.userAdress,
                          destinationAddress:
                              findingRidePageViajeRecord.destinationAddress,
                          webGoogleMapsApiKey:
                              'AIzaSyAtj0vRr2DzWQN4pjxEkkJUn7V5swv6oBw',
                          endCoordinate:
                              findingRidePageViajeRecord.destinationLocation!,
                        ),
                      ),
                    ),
                  if (!findingRidePageViajeRecord.isDriverAssigne)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RoutViewLive(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: Colors.black,
                          startAddress: findingRidePageViajeRecord.userAdress,
                          destinationAddress:
                              findingRidePageViajeRecord.destinationAddress,
                          webGoogleMapsApiKey:
                              'AIzaSyAtj0vRr2DzWQN4pjxEkkJUn7V5swv6oBw',
                          endCoordinate:
                              findingRidePageViajeRecord.destinationLocation!,
                          rideDetailsReference:
                              findingRidePageViajeRecord.reference,
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (findingRidePageViajeRecord.isDriverAssigne)
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
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
                                      Expanded(
                                        child: Text(
                                          'Abastecedor Encontrado',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.local_gas_station_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 30.0,
                                      ),
                                      Icon(
                                        Icons.check_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 25.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (findingRidePageViajeRecord.isDriverAssigne)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
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
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'Llegamos a ti',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFAppState().routeDuration,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                ),
                                                Text(
                                                  FFAppState().routeDistance,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            Color(0xFFFFFDFD),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          width: 48.0,
                                          height: 48.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/608/600',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  findingRidePageViajeRecord
                                                      .driverName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                ),
                                                Text(
                                                  'placa',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
