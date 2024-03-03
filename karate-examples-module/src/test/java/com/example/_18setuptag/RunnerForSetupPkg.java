/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._18setuptag;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForSetupPkg {

    @Karate.Test
    Karate testForSetupTag(){

        return Karate.run("classpath:com/example/_18setuptag/1.setupusage.feature");
    }

    @Karate.Test
    Karate testForMultipleSetupTag(){

        return Karate.run("classpath:com/example/_18setuptag/2.multiplesetupusage.feature");
    }

    @Karate.Test
    Karate testForDataDrivenSetupTag(){

        return Karate.run("classpath:com/example/_18setuptag/3.setuptagfordatadriven.feature");
    }
}
