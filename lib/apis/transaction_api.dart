import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mon_sms_pro/models/api_response_model.dart';
import 'package:mon_sms_pro/models/transaction/transaction_model.dart';
import 'package:mon_sms_pro/models/utils.dart';

/// A class to handle API interactions related to transactions.
class TransactionApi {
  final Dio _dio;
  final String _baseUrl;
  final String _apiKey;

  /// Constructs a TransactionApi instance.
  ///
  /// [dio] is the Dio client for making HTTP requests.
  /// [baseUrl] is the base URL of the API.
  /// [apiKey] is the API key used for authentication.
  const TransactionApi({
    required Dio dio,
    required String baseUrl,
    required String apiKey,
  })  : _dio = dio,
        _apiKey = apiKey,
        _baseUrl = baseUrl;

  /// Checks the status of a transaction.
  ///
  /// [id] is the ID of the transaction to check.
  /// Returns the `TransactionModel` instance.
  Future<ApiResponseModel<TransactionModel?>> check({
    required String id,
  }) async {
    final url = "$_baseUrl/transaction/$id/check";

    final payload = {
      'apiKey': _apiKey,
    };

    debugPrint("flutter_mon_sms_pro/transaction/check/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/transaction/check/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => TransactionModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Updates the status of a transaction.
  ///
  /// [id] is the ID of the transaction to update.
  /// [status] is the new status of the transaction.
  /// Returns the updated `TransactionModel` instance.
  Future<ApiResponseModel<TransactionModel?>> update({
    required String id,
    required TransactionStatus status,
  }) async {
    final url = "$_baseUrl/transaction/$id/update";

    final payload = {
      'apiKey': _apiKey,
      'status': status.value,
    };

    debugPrint("flutter_mon_sms_pro/transaction/update/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/transaction/update/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => TransactionModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Creates a new transaction for credit purchase.
  ///
  /// [offerId] is the ID of the offer to purchase.
  /// [paymentMethod] is the payment method to use.
  /// [companyId] is an optional company ID.
  /// Returns the created `TransactionModel` instance.
  Future<ApiResponseModel<TransactionModel?>> create({
    required String offerId,
    required PaymentMethod paymentMethod,
    String? companyId,
  }) async {
    final url = "$_baseUrl/transaction/create";

    final payload = {
      'apiKey': _apiKey,
      'offerId': offerId,
      'paymentMethod': paymentMethod.value,
      if (companyId != null) 'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/transaction/create/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/transaction/create/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => TransactionModel.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }

  /// Lists transactions for the current user.
  ///
  /// [count] is the number of transactions to return per page.
  /// [page] is the page number.
  /// [companyId] is an optional company ID filter.
  /// Returns a list of `TransactionModel` instances.
  Future<ApiResponseModel<List<TransactionModel>>> list({
    int? count,
    int? page,
    String? companyId,
  }) async {
    final url = "$_baseUrl/transaction/list";

    final payload = {
      'apiKey': _apiKey,
      if (count != null) 'count': count,
      if (page != null) 'page': page,
      if (companyId != null) 'companyId': companyId,
    };

    debugPrint("flutter_mon_sms_pro/transaction/list/payload: $payload");

    final r = await _dio.post(url, data: payload);

    debugPrint("flutter_mon_sms_pro/transaction/list/data: ${r.data}");

    final response = ApiResponseModel.fromJson(
      r.data,
      (data) => (data as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }
}
