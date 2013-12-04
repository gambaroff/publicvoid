Feature: Uploading File

  Scenario: Unsuccessful upload
    Given a user visit the upload page
    When the user clicks Add files button and adds file format
    Then they should see an error message
      And they should see a start link unavailable
      And they should see a cancel link unavailable

  Scenario: Successful upload
    Given a user visit the upload page
    When the user clicks Add files button
    Then they should see the name of their file added
      And they should see a start link
      And they should see a cancel link