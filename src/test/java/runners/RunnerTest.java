package runners;

import com.intuit.karate.junit5.Karate;

public class RunnerTest {

    @Karate.Test
    Karate test() {
        return Karate.run("classpath:features");
    }
}