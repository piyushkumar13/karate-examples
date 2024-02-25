/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.karatejunit.example;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerTest {


    /* We can use @Karate.Test annotation */

    @Karate.Test
    Karate testExampleUsingKarateAnnotation1(){

        return Karate.run("setupexample/createuser.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testExampleUsingKarateAnnotation2(){

//        return Karate.run("classpath:com/karatejunit/example/setupexample/createuser.feature");

        /* By using a classpath we can also run the package as well as follows */

        return Karate.run("classpath:com/karatejunit/example/setupexample");

    }

    /* We can also use JUnit @Test annotation as well. */

    @Test
    void testExampleUsingJunitAnnotation(){

        Results results = Runner.path("classpath:com/karatejunit/example/setupexample").parallel(1);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
