require "rails_helper"

describe WordCount do
  describe "associations" do
    it { should belong_to :vent }
    it { should belong_to :word }
  end
end
