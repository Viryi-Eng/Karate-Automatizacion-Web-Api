@crud
Feature: CRUD de Órdenes

  Background:

    * url baseUrl
    * def authToken = 'Bearer ' + accessToken

  Scenario: Crear, Consultar y Eliminar Orden

    # CREAR

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

    # CONSULTAR

    Given path 'orders', orderId
    And header Authorization = authToken
    When method get
    Then status 200

    # ELIMINAR

    Given path 'orders', orderId
    And header Authorization = authToken
    When method delete
    Then status 204