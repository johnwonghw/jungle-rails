require 'rails_helper'

RSpec.describe User, type: :model do
  
    before :each do
      @user = User.create first_name: "Bob", last_name: "the Builda", email: "bob@buildersclub.com", password:"choochoo", password_confirmation:"choochoo"
      @user.save
      @baduser0 = User.create
      @baduser1 = User.create password: "choochoo", password_confirmation: "bumbum", email: "bob@buildersclub1.com"
    end
  
  describe 'Validations' do
    it "should have a first name" do
      expect(@user).to be_valid
      expect(@baduser0.errors.messages[:first_name]).to include("can't be blank")
    end
    
    it "should have a last name" do
      expect(@user).to be_valid
      expect(@baduser0.errors.messages[:last_name]).to include("can't be blank")
    end
    
    it "should have a email" do
      expect(@user).to be_valid
      expect(@baduser0.errors.messages[:email]).to include("can't be blank")
    end

    it "should have a password" do
      expect(@user).to be_valid
      expect(@baduser0.errors.messages[:password]).to include("can't be blank")
    end

    it "should match password to password_confirmation" do
      expect(@user.password).to eq(@user.password_confirmation)
      expect(@baduser1.password).to_not eq(@baduser1.password_confirmation)  
    end

    it "should have a unique, case-sensitive email" do
      @bademail = User.create email: "Bob@buildersclub.com"
      expect(@bademail.errors.messages[:email]).to include("has already been taken")
    end

    it "should have password length > 6" do
      @badpasswordlength = User.create password: "short"
      expect(@badpasswordlength.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate when credentials match" do
      user = User.authenticate_with_credentials('bob@buildersclub.com', 'choochoo')
      expect(user).to eq(@user)
    end

    it "should not authenticate when credentials don't match" do
      baduser = User.authenticate_with_credentials('cornonthecob@buildersclub.com', 'choochoo')
        expect(baduser).to_not eq(@user)
    end

    it "should authenticate with white spaces" do
      email_no_space = User.authenticate_with_credentials('  bob@buildersclub.com  ', 'choochoo')
        expect(email_no_space).to eq(@user)
    end
    
    it "should not authenticate when email is not case senstitive " do
      email_case_sensitive = User.authenticate_with_credentials('BoB@builDeRSCluB.Com', 'choochoo')
        expect(email_case_sensitive).to eq(@user)
    end
  end
end
