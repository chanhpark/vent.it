require "rails_helper"

describe Comment do
  describe "attributes" do
    it { should respond_to :user }
    it { should respond_to :reply }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end

  describe "validations" do
    it { should validate_presence_of :reply }
  end

  describe "associations" do
    it { should belong_to :vent }
    it { should belong_to :user }
  end
end
