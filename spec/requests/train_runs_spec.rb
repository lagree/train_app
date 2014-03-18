require 'spec_helper'

describe "TrainRuns" do
  describe "index page" do
    it "displays the index" do
      visit '/'
      expect(page).to have_content('Chicago Train Routes')
    end
  end
end
