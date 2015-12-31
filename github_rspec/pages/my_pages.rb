class HomePage < WebPage
  URL = 'https://github.com'
  validates :url, pattern: /https:\/\/github.com/
  add_locator :messages, 'span.octicon.octicon-bell'
  add_button_locator :signup_button, 'Sign up'

  def self.click_signup
    click_button(button_locator :signup_button)
  end

  def self.check_logged?
    find(locator(:messages))
    expect (HomePage.given.text).to include('Welcome to GitHub')
  end
end

class JoinPage < WebPage
  URL =  'https://github.com/join'
  validates :url, pattern: /https:\/\/github.com\/join/
  add_locator :problems, xpath: '//div[contains(text(),"There were problems creating your account")]'
  add_locator :login_blank, xpath: '//dd[contains(text(),"Login can")]'
  add_locator :email_invalid, xpath: '//dd[contains(text(),"Email is invalid")]'
  add_locator :password_blank, xpath: '//dd[contains(text(),"Password can")]'
  add_locator :login_taken, xpath: '//dd[contains(text(),"Username is already taken")]'
  add_locator :email_taken, xpath: '//dd[contains(text(),"Email is already taken")]'
  add_field_locator :username, 'user_login'
  add_field_locator :email, 'user_email'
  add_field_locator :password, 'user_password'
  add_button_locator :signup_button, 'Sign up'
  add_button_locator :create_account, 'Create an account'

  def self.correct_filling
    fill_in(field_locator(:username), with:'strongtestqa')
    fill_in(field_locator(:email), with:'strongtestqa@gmail.com')
    fill_in(field_locator(:password), with:'Su123456')
    click_button (button_locator :create_account)
  end

  def self.blank_data
    fill_in(field_locator(:username), with:'')
    fill_in(field_locator(:email), with:'')
    fill_in(field_locator(:password), with:'')
    click_button (button_locator :create_account)
  end

  def self.incorrect_email
    fill_in(field_locator(:username), with:'strongtestqa')
    fill_in(field_locator(:email), with:'strongtestqa.gmail.com')
    fill_in(field_locator(:password), with:'Su123456')
    click_button (button_locator :create_account)
  end

  def self.check_errors_when_blank_data
    find(locator(:problems))
    find(locator(:login_blank))
    find(locator(:password_blank))
  end

  def self.check_errors_when_incorrect_email
    find(locator(:problems))
    find(locator(:email_invalid))
  end

  def self.check_errors_when_dublicated_data
    find(locator(:login_talen))
    find(locator(:email_taken))
  end
end

class PlanPage < WebPage
  URL =  'https://github.com/join/plan'
  validates :url, pattern: /https:\/\/github.com\/join\/plan/

  add_button_locator :finish, 'Finish sign up'

  def self.click_finish
    click_button(button_locator :finish)
  end
end
