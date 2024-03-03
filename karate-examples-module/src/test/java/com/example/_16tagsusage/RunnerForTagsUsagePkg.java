/*
 *  Copyright (c) 2023 DMG
 *  All Rights Reserved Worldwide.
 *
 *  THIS PROGRAM IS CONFIDENTIAL AND PROPRIETARY TO DMG
 *  AND CONSTITUTES A VALUABLE TRADE SECRET.
 */

package com.example._16tagsusage;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

/**
 * To run from command like to execute tag we can run commands as follows :
 * mvn test "-Dkarate.options= --tags @Smoke"
 * mvn test "-Dkarate.options= --tags ~@Smoke"
 * mvn test "-Dkarate.options= --tags @Smoke @Sanity"
 * mvn test "-Dkarate.options= --tags @Smoke --tags @Sanity"
 * mvn test "-Dkarate.options= --tags @Smoke --tags ~@Sanity"
 * mvn test "-Dkarate.options= classpath:com/example/_16tagsusage/1.tagsforscenario.feature --tags @Smoke"
 *
 * @author Piyush Kumar.
 * @since 25/02/24.
 */
public class RunnerForTagsUsagePkg {

//    Using junit test
//    @Test
//    void testTagsUsageUsingJunitTest(){
//
//        Results results = Runner
//            .path("classpath:com/example/_16tagsusage/1.tagsforscenario.feature")
//            .tags("@Sanity")
//            .parallel(1);
//
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }

    //    Using karate junit test
    @Karate.Test
    Karate testTagsUsageUsingKarateJunitTest() {

        return Karate.run("classpath:com/example/_16tagsusage/1.tagsforscenario.feature")
//            .tags("@Sanity") // will run scenarios tagged with @Sanity, if any scenario having @Sanity and @Smoke - that will also be executed
//            .tags("@Smoke") // will run scenarios tagged with @Smoke, if any scenario having @Sanity and @Smoke - that will also be executed
//            .tags("@Smoke, @Sanity") // will run scenrios tagged with @Smoke or @Sanity
//            .tags("~@Smoke") // will run scenarios not tagged with @Smoke
//            .tags("@Sanity, ~@Smoke") // will run scenarios tagged with @Sanity or not @Smoke. When comma given within same string is mean OR.
            .tags("@Sanity", "~@Smoke") // will run scenarios tagged with @Sanity and should not have @Smoke.
            ;
    }
}
