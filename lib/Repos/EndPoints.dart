enum ENDPOINT {
  GET_RECEIVED_TB,
  GET_SENT_TB,
  PUT_THANKS_BOX,
  GET_WORKER,
  GET_TEMPLATE
}

abstract class EndpointConfig {
  static const String _host = "https://local.timely.mn";
  static const String _httpPathConst = "/api";

  static final Map<ENDPOINT, String> _ENDPOINTS = {
    ENDPOINT.GET_RECEIVED_TB: "thanks_box.php",
    ENDPOINT.GET_SENT_TB: "thanks_box.php",
    ENDPOINT.PUT_THANKS_BOX: "thanks_box_insert.php",
    ENDPOINT.GET_WORKER: "workers.php",
    ENDPOINT.GET_TEMPLATE: "thanks_box_template.php",
  };

  static String getEnpoint(ENDPOINT endpoint) =>
      "$_host$_httpPathConst${_ENDPOINTS[endpoint]}";
}
