class ConfigurationModel {
  String? version;
  String? welcomeMessage;

  ConfigurationModel({
    this.version,
    this.welcomeMessage,
  });

  ConfigurationModel.fromJson(Map<String, dynamic> json) {
    version = json["version"];
    welcomeMessage = json["welcomeMessage"];
  }

  Map<String, dynamic> toJson() => {
        "version": version,
        "welcomeMessage": welcomeMessage,
      };
}
