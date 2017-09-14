Feature: sign in to redfin

@sign_in
Scenario: sign in with email
 Given a user opens redfin page
 And a user has valid email "shuzhan16@hotmail.com" and password "Password1"
 When the user click sign in button
 Then login should be successful

