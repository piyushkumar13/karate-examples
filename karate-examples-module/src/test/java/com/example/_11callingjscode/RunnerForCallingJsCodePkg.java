/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._11callingjscode;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForCallingJsCodePkg {

    @Karate.Test
    Karate testCallingJsCodePkg(){

        return Karate.run("classpath:com/example/_11callingjscode/1.callingjscode.feature");
    }
}
