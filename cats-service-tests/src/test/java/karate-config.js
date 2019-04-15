function () {
    var URL = 'https://my-json-server.typicode.com/arcones/karate-apiDaysMad19';
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.log("API URL: " + URL);
    return {
       baseURL: URL
    };
}