/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._12usingrepeatmethod.utils;

import net.datafaker.Faker;

/**
 * @author Piyush Kumar.
 * @since 28/02/24.
 */
public class FakerUtils {

    private static final Faker FAKER = new Faker();


    public static String getFullName(){
        return FAKER.name().fullName();
    }

    public static String getFirstName(){
        return FAKER.name().firstName();
    }

    public static String getLastName(){
        return FAKER.name().lastName();
    }

    public static int getId(){
        return Integer.parseInt(FAKER.number().digits(2));
    }
}
