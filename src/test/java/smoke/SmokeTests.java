package smoke;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import static java.util.concurrent.TimeUnit.SECONDS;
import static org.assertj.core.api.Assertions.assertThat;
import static org.awaitility.Awaitility.await;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = SmokeTests.class,
        webEnvironment = SpringBootTest.WebEnvironment.NONE)
public class SmokeTests {

    @Value("${application.host:localhost:8081}")
    private String applicationHost;

    @Value("${test.timeout:60}")
    private int timeout;

    TestRestTemplate restTemplate = new TestRestTemplate();

    @Test
    public void canSayHello() {
        await().atMost(this.timeout, SECONDS).untilAsserted(() -> {
            ResponseEntity<String> responseEntity = this.restTemplate
                    .getForEntity(buildUrl("/hello/shaun"), String.class);

            assertThat(responseEntity.getStatusCode().is2xxSuccessful()).isTrue();
            assertThat(responseEntity.getBody()).isEqualToIgnoringCase("Hello, shaun");
        });
    }

    private String buildUrl(String path) {
        return String.format("http://%s/%s", this.applicationHost, path);
    }

}
