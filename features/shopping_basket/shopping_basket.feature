Feature: Shopping basket
  In order to purchase, I need to add products to shopping basket
  I can remove the products from the list

  Background:
    Given I register and go to feed screen
    When go to product shop this screen

    Scenario: Empty shopping bag
      And go to shopping bag list
      Then your shopping bag is empty message is displayed

    Scenario: Add item to shopping basket
      And I capture product details
      And add product to shopping basket
      Then product is listed in shopping basket

    Scenario: Checkout the shopping bag
      And add product to shopping basket
      And go to shopping bag list
      And click proceed to purchase button
      Then goes to nap checkout process

    Scenario: Check total purchase price
      And add product to shopping basket
      And I add another product to shopping basket
      When go to shopping bag list
      And perform addition calculation on product price
      Then total price match to calculation