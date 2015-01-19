require "rails_helper"

describe Category do
  describe "associations" do
    it { should have_many :vents }
  end
end
