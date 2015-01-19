require "rails_helper"

describe Vent do
  describe "attributes" do
    it { should respond_to :title }
    it { should respond_to :content }
    it { should respond_to :category_id }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :category_id }
  end

  describe "associations" do
    it { should belong_to :category }
    it { should have_many :comments }
    it { should have_many :word_counts }
  end
end
