/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._4globalenvvars;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForGlobalEnvVarPkg {

    @Karate.Test
    Karate testReadingGlobalConfig(){

        return Karate.run("classpath:com/example/_4globalenvvars/1.UseKarateConfigVars.feature");
    }

//    @Karate.Test
//    Karate testCreateReadJson(){
//
//        return Karate.run("classpath:com/example/_2jsonmanipulation/2.CreateJson.feature");
//    }
}
