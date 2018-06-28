# frozen_string_literal: true

require 'rails_helper'

feature 'Authentication', type: :feature do
  include AuthenticationHelper
  context 'when a user signs up' do
    it 'creates a user in the database' do
      user = sign_up
      user_db = User.find_by_id(user.id)
      expect(user_db).to be_valid
    end
  end

  context 'when a user logs in' do
    it 'is signed in' do
      log_in
      expect(user_signed_in?).to be_true
    end
  end
end
