class APISConfig {
  var Base_URL = apiURL();
}

String apiURL() {
  /* Development URL */
  // var apiURL = 'http://87.200.95.206:3333/api/';

  /* Production URL */
  var apiURL = 'https://api.openweathermap.org/data/2.5/';
  print(apiURL);
  return apiURL;
}
