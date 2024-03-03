/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._9callinganotherfeaturefile;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForCallingAnotherFeatureFilePkg {

    @Karate.Test
    Karate testCallingAnotherFeatureFilePkg(){

        return Karate.run("classpath:com/example/_9callinganotherfeaturefile/1.callinganotherfeaturefile.feature");
    }
}
