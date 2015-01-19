require "rails_helper"

describe Word do
  describe "associations" do
    it { should have_many :word_counts }
  end
  describe "validations" do
    it { should validate_presence_of :word }
  end
end
