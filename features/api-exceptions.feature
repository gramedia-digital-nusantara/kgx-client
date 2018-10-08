Feature: Ensure that the API errors are handled properly

  Scenario: Serialization
    Given API error JSON
    When I deserialize it
    Then the error class is instantiated correctly
