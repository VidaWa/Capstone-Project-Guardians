@TestAllScenarios
Feature: Retail Account Page
  ​

  Background: 
    Given User is on retail website
    When User click on Sign in option
    And User enter email 'guardians2023@gmail.com' and password 'Guardians@2023'
    And User click on login button
    And User should be logged in into Account
    When User click on Account option

  @updateAccount
  Scenario: Verify User can update Profile Information
    And User update Name 'GuardianVH' and Phone '2021234569'
    And User click on Update button
    Then user profile information should be updated

  @addPaymentMethod
  Scenario: Verify User can add a payment method
    And User click on Add a payment method link
    And User fill Debit or credit card information
      | cardNumber       | nameOnCard | expirationMonth | expirationYear | securityCode |
      | 1111222233331111 | Guardians  |              10 |           2027 |          123 |
    # Above datatable is a list of map because in map data are presented as a pair of keys and values
    And User click on Add your card button
    Then a message should be displayed 'Payment Method added sucessfully'

  @editCard
  Scenario: Verify User can edit Debit or Credit card
    #The first step was added by me.
    And User click on existed card
    And User click on Edit option of card section
    And user edit information with below data
      | cardNumber       | nameOnCard | expirationMonth | expirationYear | securityCode |
      | 1111222233337777 | Guards     |              12 |           2026 |          333 |
    And user click on Update Your Card button
    Then a message should be displayed 'Payment Method updated Successfully'

  @removeCard
  Scenario: Verify User can remove Debit or Credit card
    #The first step was added by me.
    And User click on the existed card
    And User click on remove option of card section
    Then payment details should be removed

  @addAddress
  Scenario: Verify User can add an Address
    And User click on Add address option
    And user fill new address form with below information
      | country       | fullName | phoneNumber | streetAddress  | apt       | city      | state | zipCode |
      | United States | Mahmood  |  2024567891 | 8939 Ozzie Run | Suite 192 | West Bill | Utah  |   73463 |
    And User click Add Your Address button
    Then a message should be displayed 'Address Added Successfully'

  @editAddress
  Scenario: Verify User can edit an Address added on account
    And User click on edit address option
    And user fill the new address form with below information
      | country       | fullName | phoneNumber | streetAddress | apt       | city      | state | zipCode |
      | United States | Karim    |  2024567891 | 8939 Box Run  | Suite 192 | West Bill | Utah  |   73463 |
    And User click update Your Address button
    Then a message should be displayed 'Address Updated Successfully'

  @removeAdderess
  Scenario: Verify User can remove Address from Account
    And User click on remove option of Address section
    Then Address details should be removed
