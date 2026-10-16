@bug
Feature: Defecto actualización de órdenes

  Background:
    * url baseUrl
    * def authToken = 'Bearer ' + accessToken

  Scenario: Validar actualización

    Given path 'orders'
    And header Authorization = authToken
    And request
    """
    {
      "bookId": 1,
      "customerName": "Virgilio QA"
    }
    """
    When method post
    Then status 201

    * def orderId = response.orderId

    Given path 'orders', orderId
    And header Authorization = authToken
    And request
    """
    {
      "customerName": "Virgilio QA Modificado"
    }
    """

    When method patch

    * print 'STATUS:', responseStatus
    * print 'HEADERS:', responseHeaders
    * print 'BODY:', response

    Then status 308