Feature: Generar Token

  Scenario: Obtener Token

    * def email = 'virgilio' + java.util.UUID.randomUUID() + '@test.com'

    Given url 'https://simple-books-api.glitch.me'
    And path 'api-clients'

    And request
    """
    {
      "clientName": "Virgilio QA",
      "clientEmail": "#(email)"
    }
    """

    When method post
    Then status 201

    * def accessToken = response.accessToken
