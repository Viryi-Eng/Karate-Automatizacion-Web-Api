function fn() {

    var config = {
        baseUrl: 'https://simple-books-api.glitch.me'
    };

    var result = karate.callSingle('classpath:features/token.feature');

    config.accessToken = result.accessToken;

    return config;
}