class BasePayload {
  final String? apiKey;

  BasePayload({
    this.apiKey,
  });

  factory BasePayload.fromJson(Map json) {
    return BasePayload(
      apiKey: json['apiKey'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
    };
  }
}
