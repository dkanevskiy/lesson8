require_relative '../../pages/my_pages'
#############################################################
#                      PREREQUISITES                        #
#############################################################

Given(/^home page of web app$/) do
  HomePage.open 'https://github.com'
end

Given(/^join page of web app$/) do
  JoinPage.open 'https://github.com/join'
end

Given(/^registered user in the system$/) do
  JoinPage.correct_filling
end
####################################
#              ACTIONS             #
####################################
When(/^I click on signin menu item$/) do
  HomePage.click_signup
end

When(/^I fill and submit form on join page with correct data$/) do
  JoinPage.correct_filling
end

Then(/^I confirm action on plan page$/) do
  PlanPage.click_finish
end

When(/^I fill and submit form on join page with blank data$/) do
  JoinPage.blank_data
end

When(/^I fill and submit form on join page with incorrect email$/) do
  JoinPage.incorrect_email
end

And(/^I fill and submit form with the same data$/) do
  JoinPage.correct_filling
end
####################################
#              CHECKS              #
####################################

Then(/^I should be redirected to (.+) page$/) do |page|
  page.wait_for_opened
end

Then(/^I should be logged and redirected to home page$/) do
  HomePage.check_logged?
end

Then(/^I should see info on join page that data can not be blank$/) do
  JoinPage.check_errors_when_blank_data
end

Then(/^I should see info on join page that email is incorrect$/) do
  JoinPage.check_errors_when_incorrect_email
end

Then(/^I should see info on join page that email and login are already taken$/) do
  JoinPage.check_errors_when_dublicated_data
end