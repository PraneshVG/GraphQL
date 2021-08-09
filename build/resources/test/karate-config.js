
function() {
    var config = {
    }
    config.baseUrl = 'https://api.spacex.land';
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 40000);
    return config;
}