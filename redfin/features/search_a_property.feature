Feature: search a property in an area

@search_in_an_area
Scenario: search in an area
 Given a user provides city and state "Irvine, CA"
 When the user click the search button
 Then the result should return properties in the area "Irvine"

@search_in_an_area_with_filters 
Scenario: add filters
 Given a user provides city and state "Irvine, CA"
 When the user click the search button
 And a user click more filters button
 And add filters with the following:
   | filter | value |
   | minBeds| 3     |
  #| minSqft| 1500  | 
  #| minYear| 2017  |
 Then the result should match the criteria

