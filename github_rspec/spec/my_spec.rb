require_relative '../pages/my_pages'

RSpec.describe 'GitHub signup' do
  scenario 'User can open join page via menu' do
    HomePage.open 'https://github.com'
    HomePage.click_signup
    expect(JoinPage).to be_displayed
  end

  scenario 'User can sign in with correct data' do
    JoinPage.open 'https://github.com/join'
    JoinPage.correct_filling
    PlanPage.click_finish
    HomePage.check_logged?
  end

  scenario 'User can not sign in with blank data' do
    JoinPage.open 'https://github.com/join'
    JoinPage.blank_data
    JoinPage.check_errors_when_blank_data
  end

  scenario 'User can not sign up with incorrect email' do
    JoinPage.open 'https://github.com/join'
    JoinPage.incorrect_email
    JoinPage.check_errors_when_incorrect_email
  end

  scenario 'User can not sign up with duplicated data' do
    JoinPage.open 'https://github.com/join'
    JoinPage.correct_filling
    PlanPage.click_finish
    JoinPage.correct_filling
    JoinPage.check_errors_when_dublicated_data
  end
end