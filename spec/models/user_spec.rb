require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    describe 'User.save' do
      it 'should save a valid user' do
        @user = User.new(
          first_name: 'John',
          last_name: 'Smith',
          email: 'test@mail.com',
          password: '123456',
          password_confirmation: '123456'
        )
        expect(@user).to be_valid
      end
    end


    it 'should have a first name' do
      @user = User.create(
          first_name: nil,
          last_name: 'Smith',
          email: 'test@mail.com',
          password: '123456',
          password_confirmation: '123456'
        )
      expect(@user.errors.messages[:first_name]).to include("can't be blank")
    end


    it 'should have a last name' do
      @user = User.create(
          first_name: 'John',
          last_name: nil,
          email: 'test@mail.com',
          password: '123456',
          password_confirmation: '123456'
        )
      expect(@user.errors.messages[:last_name]).to include("can't be blank")
    end


    it 'should have an email' do
      @user = User.create(
          first_name: 'John',
          last_name: 'Smith',
          email: nil,
          password: '123456',
          password_confirmation: '123456'
        )
      expect(@user.errors.messages[:email]).to include("can't be blank")
    end


    it 'should have a password' do
      @user = User.create(
          first_name: 'John',
          last_name: 'Smith',
          email: 'test@mail.com',
          password: nil,
          password_confirmation: '123456'
        )
      expect(@user.errors.messages[:password]).to include("can't be blank")
    end


    it 'should have a password confirmation' do
      @user = User.create(
          first_name: 'John',
          last_name: 'Smith',
          email: 'test@mail.com',
          password: '123456',
          password_confirmation: nil
        )
      expect(@user.errors.messages[:password_confirmation]).to include("can't be blank")
    end


    it 'should have a unique email' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @user2 = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'TEST@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(@user2.errors.messages).to include( { :email => ["has already been taken"]} )
    end


    it 'should have a password matching password confirmation' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123465'
      )
      expect(@user.errors.messages).to include( { :password_confirmation => ["doesn't match Password"]} )
    end


    it 'should have a minimum password length' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '12345',
        password_confirmation: '12345'
      )
      expect(@user.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should return an instance of user when given valid email and password' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @testuser = User.authenticate_with_credentials('test@mail.com', '123456')
      expect(@testuser).to be_an_instance_of(User)
      expect(@testuser).to eql(@user)
    end


    it 'should return false if email is invalid' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @testuser = User.authenticate_with_credentials('John@mail.com', '123456')
      expect(@testuser).to be false
    end


    it 'should return false if email or password is invalid' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @testuser = User.authenticate_with_credentials('test@mail.com', '123455')
      expect(@testuser).to be false
    end

    it 'should remove whitespace in email' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @testuser = User.authenticate_with_credentials('  test@mail.com  ', '123456')
      expect(@testuser).to be_an_instance_of(User)
    end

    it 'should log user in if they use CAPS' do
      @user = User.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'test@mail.com',
        password: '123456',
        password_confirmation: '123456'
      )
      @testuser = User.authenticate_with_credentials('TEST@MAIL.com', '123456')
      expect(@testuser).to be_an_instance_of(User)
    end

  end

end
