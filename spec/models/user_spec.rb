# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let (:subject) { build(:random_user) }

    context 'when valid attributes' do
      it { is_expected.to be_valid }
    end

    context 'when has no nickname' do
      it 'is not valid' do
        subject.nickname = ''
        is_expected.to_not be_valid
      end
    end

    context 'is not valid without a first name' do
      it 'is not valid' do
        subject.firstname = ''
        is_expected.to_not be_valid
      end
    end

    context 'is not valid without a surname' do
      it 'is not valid' do
        subject.surname = ''
        is_expected.to_not be_valid
      end
    end

    context 'is not valid without an email' do
      it 'is not valid' do
        subject.email = ''
        is_expected.to_not be_valid
      end
    end

    context 'is not valid without a password' do
      it 'is not valid' do
        subject.password = ''
        is_expected.to_not be_valid
      end
    end
  end
end
