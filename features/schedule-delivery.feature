Feature: Delivery Scheduling
  This is the main use of the KGX Client.  Delivery scheduling
  (more correctly called 'Pickup Scheduling') is how a client informs
  KGX they have a package that needs picked-up and delivered to a client.
  Within this library, we refer to it as 'Delivery Scheduling' to keep the
  terminology in line with what is states in KGX's API documentation.

  Scenario: Request Serialization
    Given a simulated ScheduleDeliveryRequest request
    When I serialize the request
    Then the request is serialized correctly for /create_order

  Scenario: Response Deserialization
    Given a simulated response from /create_order
    When I deserialize the response as DeliveryScheduledResponse
    Then the response is deserialized correctly for a DeliveryScheduledResponse

  Scenario: Delivery Scheduling via Client
    Given a production API client
    And a simulated response from /create_order
    When I perform a delivery schdedulling
    Then the request is a POST made to http://api.kgx.co.id/api/create_order
    And the request credentials are set properly
    And the response is deserialized correctly for a DeliveryScheduledResponse
