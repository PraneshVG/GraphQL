Feature: Test GraphQL Schema and Resolver

  Background:
    * url baseUrl + '/graphql'

    Scenario: Test for valid GraphQL Schema and Resolver

      Given text query =
      """
      {
        launchesPast {
          mission_name
          launch_date_local
          launch_site {
            site_name_long
          }
        }
      }
      """
      And request {query: '#(query)'}
      When method post
      Then status 200
      And match $.data.launchesPast[0].mission_name == 'Starlink-15 (v1.0)'
      And match $.data.launchesPast[0].mission_name == '#string'
      And match $.data.launchesPast[0].launch_date_local == '#string'
      And match response.error == '#notpresent'

  Scenario: Test for Invalid GraphQL Schema and Resolver

    Given text query =
      """
      {
        launchesPast {
          mission_name123
          launch_date_local123
          launch {
            site_name_
          }
        }
      }
      """
    And request {query: '#(query)'}
    When method post
    Then status 400