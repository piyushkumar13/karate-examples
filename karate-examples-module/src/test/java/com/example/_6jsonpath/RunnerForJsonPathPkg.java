/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._6jsonpath;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForJsonPathPkg {

    @Karate.Test
    Karate testJsonPathTracing(){

        return Karate.run("classpath:com/example/_6jsonpath/1.TraceJsonPathInDiffWays.feature");
    }
}
