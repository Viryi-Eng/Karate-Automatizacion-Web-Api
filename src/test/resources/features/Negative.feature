@negative
Feature: Escenarios Negativos

  Background:

    * url baseUrl
    * def authToken = 'Bearer ' + accessToken

  Scenario: Consultar Orden Inexistente

    Given path 'orders', '123456789'

    And header Authorization = authToken

    When method get

    Then status 404

  Scenario: Crear Orden Sin Token

    Given path 'orders'

    And request
    """
    {
      "bookId": 1,
      "customerName": "Usuario Sin Token"
    }
    """

    When method post

    Then status 401

  Scenario: Eliminar Orden Inexistente

    Given path 'orders', '123456789'

    And header Authorization = authToken

    When method delete

    Then status 404