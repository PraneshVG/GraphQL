Feature: Test GraphQL Schema and Resolver using external file

  Background:
    * url baseUrl + '/graphql'
    * def sampleSchema = read('contact/schemaTest.json')

  Scenario: Test for valid GraphQL Schema and Resolver
    Given def query = read('queries/searchByName.graphql')
    And def variables = {id: '7'}
    And request { query: '#(query)', variables: '#(variables)' }
    When method POST
    Then status 200
    And match response == sampleSchema
