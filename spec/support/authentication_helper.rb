# frozen_string_literal: true

module AuthenticationHelper
  def sign_up
    visit '/'

    user = FactoryBot.new(:random_user)

    click_button 'Sign up'
    fill_in 'nickname', with: user.nickname
    fill_in 'firstname', with: user.firstname
    fill_in 'surname', with: user.surname
    fill_in 'age', with: user.age
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Sign up'

    user
  end

  def log_in
    visit '/'

    user = FactoryBot.create(:random_user)
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'

    user
  end

  def log_out
    click_button 'Log out'
  end
end
