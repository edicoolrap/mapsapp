import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoiZWRpY29vbHJhcCIsImEiOiJjbGswcnlpeGswMDV6M29tYzJzanBuYms3In0.-nvg-2HElZIJZMEmkZPiNw';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });
    super.onRequest(options, handler);
  }
}
