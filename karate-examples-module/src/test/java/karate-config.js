/**
 *
 * This karate-config js file will be called for each scenario before executing each scenario.
 * This file supplies the config object to be used in each scenario.
 */
function fn() {

    var env = karate.env; // get system property 'karate.env'. Or pass karate.env with mvn command like mvn test -Dkarate.env=dev
    // karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'local';
    }

    // Configuring retry configuration at global level. This configuration gets overriden by scenario level configuration.
    // karate.configure('retry', {count: 2, interval: 2000})

    var config = {
        env: env,
        myVarName: 'hello karate',
        baseUrl: 'https://www.local.com',
        // for karate.properties to work pass env var with mvn command like mvn test -DpassedEnvVar=somevalue
        otherEnvVar: karate.properties['passedEnvVar'], // we can also directly use this karate.properties in the scenario also.
        empFirstName: "Piyush",
        empLastName: "Kumar",
        idValue: 100,
        isManager: true
    }
    if (env == 'dev') {

        config.env = 'dev'
        config.baseUrl = 'https://www.dev.com'

    } else if (env == 'e2e') {
        config.env = 'e2e'
        config.baseUrl = 'https://www.e2e.com'
    }
    return config;
}