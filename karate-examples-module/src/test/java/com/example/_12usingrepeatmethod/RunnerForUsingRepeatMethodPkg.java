/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._12usingrepeatmethod;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForUsingRepeatMethodPkg {

    @Karate.Test
    Karate testUsingRepeatMethodPkg(){

        return Karate.run("classpath:com/example/_12usingrepeatmethod/1.callingjscode.feature");
    }
}
