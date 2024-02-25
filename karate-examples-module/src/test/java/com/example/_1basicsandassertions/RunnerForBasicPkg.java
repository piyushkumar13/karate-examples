/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._1basicsandassertions;

import com.intuit.karate.junit5.Karate;

/**
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForBasicPkg {


    @Karate.Test
    public Karate executeGetFeature(){

        return Karate.run("classpath:com/example/_1basicsandassertions/1.basics-get-req.feature");
    }

    @Karate.Test
    public Karate executePostFeature(){

        return Karate.run("classpath:com/example/_1basicsandassertions/2.basics-post-req.feature");
    }
}
