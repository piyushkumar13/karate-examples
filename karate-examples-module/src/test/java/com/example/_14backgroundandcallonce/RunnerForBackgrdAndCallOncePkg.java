/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._14backgroundandcallonce;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForBackgrdAndCallOncePkg {

    @Karate.Test
    Karate testForBackgroundUsage(){

        return Karate.run("classpath:com/example/_14backgroundandcallonce/1.backgroundusage.feature");
    }

    @Karate.Test
    Karate testForCallOnceUsage(){

        return Karate.run("classpath:com/example/_14backgroundandcallonce/2.callonceusage.feature");
    }
}
