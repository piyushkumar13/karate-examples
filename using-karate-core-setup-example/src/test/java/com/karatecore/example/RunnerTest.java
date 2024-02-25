/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.karatecore.example;

import com.intuit.karate.Runner;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerTest {

    public static void main(String[] args) {

        /* Following paths were given when running via intellij run for main class */

        // Runner.path("/Users/pikumar/Documents/Piyush Workspace/karate-examples/using-karate-core-setup-example/src/test/java/com/karatecore/example/users/createuser.feature").parallel(1);
        // Runner.path("using-karate-core-setup-example/src/test/java/com/karatecore/example/users/createuser.feature").parallel(1);

        // We can also pass the package name, it will run all the feature files within that package.
        // Runner.path("using-karate-core-setup-example/src/test/java/com/karatecore/example/users").parallel(1);
        // Runner.path("classpath:com/karatecore/example/users").parallel(1);





        /* Following paths and maven command were given when running from terminal
         * mvn command mvn clean test-compile exec:java -Dexec.mainClass=com.karatecore.example.RunnerTest.
         * But for this, we need to change directory at the terminal to module using-karate-core-setup-example */

        // Runner.path("src/test/java/com/karatecore/example/users").parallel(1);
        // Runner.path("classpath:com/karatecore/example/users").parallel(1);





        /* Following paths and maven command were given when running from terminal at root of the project
         * mvn clean test-compile exec:java -pl using-karate-core-setup-example -Dexec.mainClass=com.karatecore.example.RunnerTest (ref : https://stackoverflow.com/a/11091569).
         * But for this, we need to move to the terminal at path using-karate-core-setup-example */

         Runner.path("classpath:com/karatecore/example/users").parallel(1);
    }
}
