require_relative '../../pages/my_pages'

module JoinPageSteps
  step "join in page of web app" do
    JoinPage.open 'https://github.com/join'
  end

  step "I fill and submit form on join in page with correct data" do
    JoinPage.correct_filling
  end

  step "I should be logged and redirected to home page" do
    HomePage.check_logged?
  end

  step "I fill and submit form on join in page with blank data" do
    JoinPage.blank_data
  end

  step "I should see info on join page that data can not be blank" do
    JoinPage.check_errors_when_blank_data
  end

  step "I fill and submit form on join in page with incorrect email" do
    JoinPage.incorrect_email
  end

  step "I should see info on join page that email is incorrect" do
    JoinPage.check_errors_when_incorrect_email
  end

  step "I fill and submit form with the same data" do
    JoinPage.correct_filling
  end

  step "I should see info on join page that email and login are already taken" do
    JoinPage.check_errors_when_dublicated_data
  end
end

module HomePageSteps
  step "home page of web app" do
    HomePage.open 'https://github.com'
  end

  step "I click on SignIn menu item" do
    HomePage.click_signup
  end

  step "I should be redirected to join page" do
    expect(JoinPage.given.text).to include('Join GitHub')
  end
end

module PlanPageSteps
  step "I confirm action on plan page" do
    PlanPage.click_finish
  end
end

RSpec.configure { |c| c.include HomePageSteps }
RSpec.configure { |c| c.include JoinPageSteps }
RSpec.configure { |c| c.include PlanPageSteps }