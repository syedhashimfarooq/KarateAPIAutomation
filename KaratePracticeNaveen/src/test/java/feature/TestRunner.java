package feature;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	Karate getAPITest() {
		return Karate.run("getapi").relativeTo(getClass());
	}

}
