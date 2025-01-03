import 'package:dio/dio.dart';

abstract class Failure{

  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioError){

    switch(dioError.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error , Please Try again!');
      // ignore: unreachable_switch_default
      default:
        return ServerFailure('Opps There was an error,Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode , dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    }
    else if (statusCode == 404){
      return ServerFailure('Your request not found, please try again!');
    }
    else if (statusCode == 500 ){
      return ServerFailure('Internal Server Error , please try again!');
    }
    else {
      return ServerFailure('Opps There was an error,Please try again');
    }
  }
}