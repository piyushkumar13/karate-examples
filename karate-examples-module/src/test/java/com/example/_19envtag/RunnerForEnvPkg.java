/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._19envtag;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForEnvPkg {

    @Karate.Test
    Karate testForDefaultEnvTag(){

        return Karate.run("classpath:com/example/_19envtag/1.envtagusage.feature");
    }

    @Karate.Test
    Karate testForDevEnvTag(){

        System.setProperty("karate.env", "dev");
        return Karate.run("classpath:com/example/_19envtag/1.envtagusage.feature");
    }

    @Karate.Test
    Karate testForQAEnvTag(){

        System.setProperty("karate.env", "qa");
        return Karate.run("classpath:com/example/_19envtag/1.envtagusage.feature");
    }

    /* Tag and env are combined with logical AND. */
    @Karate.Test
    Karate testForQAEnvAndSomethingTag(){

        System.setProperty("karate.env", "qa");
        return Karate.run("classpath:com/example/_19envtag/1.envtagusage.feature")
            .tags("@something");
    }
}
