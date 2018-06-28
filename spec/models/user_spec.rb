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

    context 'when has one-letter nickname' do
      it 'is not valid' do
        subject.nickname = 'a'
        is_expected.to_not be_valid
      end
    end

    context 'when has same nickname' do
      let (:copy) { build(:random_user, email: subject.nickname) }
      it 'is not valid' do
        copy.save
        is_expected.to_not be_valid
      end
    end

    context 'when has no firstname' do
      it 'is not valid' do
        subject.firstname = ''
        is_expected.to_not be_valid
      end
    end

    context 'when has no surname' do
      it 'is not valid' do
        subject.surname = ''
        is_expected.to_not be_valid
      end
    end

    context 'when has no email' do
      it 'is not valid' do
        subject.email = ''
        is_expected.to_not be_valid
      end
    end

    context 'when has same email' do
      let (:copy) { build(:random_user, email: subject.email) }
      it 'is not valid' do
        copy.save
        is_expected.to_not be_valid
      end
    end

    context 'when has no password' do
      it 'is not valid' do
        subject.password = ''
        is_expected.to_not be_valid
      end
    end
  end
end
