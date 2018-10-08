Feature: Rate Checking
  The KGX provides an endpoint for getting an estimated shipping cost.

  Scenario: Request Serialization
    Given a simulated CheckRateRequest request
    When I serialize the request
    Then the request is serialized correctly for /check_rate

  Scenario: Response Deserialization
    Given a simulated response from /check_rate
    When I deserialize the response as RateEstimate
    Then the response is deserialized correctly for a RateEstimate

  Scenario: Checking Shipping Rate via Client
    Given a production API client
    And a simulated response from /check_rate
    When I perform a rate lookup
    Then the request is a POST made to http://api.kgx.co.id/api/check_rate
    And the request credentials are set properly
    And the response is deserialized correctly for a RateEstimate
