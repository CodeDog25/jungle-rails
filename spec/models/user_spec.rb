require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with password and password_confirmation fields' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.save).to be true
    end

    it 'validates that password and password_confirmation match' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user.save).to be false
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'requires password and password_confirmation fields' do
      user = User.new(
        email: 'test@example.com',
        password: nil,
        password_confirmation: nil
      )
      expect(user.save).to be false
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'validates that email is unique (case-insensitive)' do
      user1 = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )

      user2 = User.new(
        email: 'TEST@example.com',
        password: 'password',
        password_confirmation: 'password'
      )

      expect(user2.save).to be false
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'requires email, first name, and last name' do
      user = User.new(
        email: nil,
        first_name: nil,
        last_name: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.save).to be false
      expect(user.errors.full_messages).to include "Email can't be blank",
                                                    "First name can't be blank",
                                                    "Last name can't be blank"
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
