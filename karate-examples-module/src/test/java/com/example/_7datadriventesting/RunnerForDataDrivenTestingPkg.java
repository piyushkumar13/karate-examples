/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._7datadriventesting;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForDataDrivenTestingPkg {

    @Karate.Test
    Karate testDataDrivenTestingPkg(){

        return Karate.run("classpath:com/example/_7datadriventesting/1.datadrivenbasics.feature");
    }

    @Karate.Test
    Karate testDataDrivenTestingPkg2(){

        return Karate.run("classpath:com/example/_7datadriventesting/2.datadrivenwithexternalfile.feature");
    }
}
