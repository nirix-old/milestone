Feature: Login
    Scenario:
        Given I am not logged in
        When I go to the login page
        And there is a user with the username of "test_user" and password of "mypassword"
        And I fill in "Username" with "test_user"
        And I fill in "Password" with "mypassword"
        And I press "Login"
        Then I should be on the project listing page
