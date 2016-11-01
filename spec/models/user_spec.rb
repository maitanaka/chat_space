require 'rails_helper'

RSpec.describe User, type: :model do
    describe '#create' do

      it "is valid with a name, email, and password" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is invalid without a name" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid with a password that has less than 5 characters " do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password][0]).to include("6文字以上で入力してください")
      end
    end
  end

