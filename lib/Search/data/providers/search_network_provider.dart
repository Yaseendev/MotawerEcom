import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/Utils/services/api_service.dart';

class SearchNetworkProvider extends ApiService {

  Future<List<dynamic>> getSearchResult(
    String userToken, String term) async {
    final Response response = await dio.get(
      Urls.SEARCH_PRODUCT +'/$term',
      options: Options(
        headers: {
          'x-auth-token': userToken,
        },
      ),
    );
    return response.data;
  }

  @override
  String getErrorMsg(Object error) {
    if (error is Exception) {
      try {
        String networkException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkException = 'Server connection canceled';
              break;
            case DioErrorType.connectTimeout:
              networkException = 'No Internet Connection';
              break;
            case DioErrorType.other:
              networkException = 'No Internet Connection';
              break;
            case DioErrorType.receiveTimeout:
              networkException =
                  'Receive timeout in connection with API server';
              break;
            case DioErrorType.response:
              if (error.error.toString().contains('XMLHttpRequest')) {
                networkException = 'Cannot connect to the server';
              } else
                switch (error.response!.statusCode) {
                  case 400:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Somethig went wrong';
                    }
                    break;
                  case 401:
                    networkException = 'Unauthorised client';
                    break;
                  case 403:
                    networkException = 'Unauthorised request';
                    break;
                  case 404:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Somethig went wrong';
                    }
                    break;
                  case 406:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Somethig went wrong';
                    }
                    break;
                  case 409:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Somethig went wrong';
                    }
                    break;
                  case 408:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Somethig went wrong';
                    }
                    break;
                  case 500:
                    try {
                      networkException = error.response!.data['error'];
                    } catch (e) {
                      networkException = 'Internal Server Error';
                    }
                    break;
                  case 503:
                    networkException = 'Service is unavailable at the moment';
                    break;
                  default:
                    networkException = error.message;
                }
              break;
            case DioErrorType.sendTimeout:
              networkException = 'Send timeout in connection with API server';
              break;
          }
        } else if (error is SocketException) {
          networkException = 'No Internet Connection';
        } else {
          networkException = 'Unexpected error occurred ${error.toString()}';
        }
        return networkException;
      } on FormatException {
        return 'Unexpected error occurred ${error.toString()}';
      } catch (e) {
        return 'No Internet Connection';
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return 'Unable to process the data';
      } else {
        return 'Unexpected error occurred ${error.toString()}';
      }
    }
  }
}