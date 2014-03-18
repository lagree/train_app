require 'spec_helper'

describe "TrainRuns" do
  describe "index page" do
    it "displays the index" do
      visit '/'
      expect(page).to have_content('Chicago Train Routes')
    end
  end

  describe "delete workflow"  do
    it "displays the index" do
   	  trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
      visit '/'
      click_link 'Delete'  #this automatically confirms the confirmation dialog
      expect(page).to have_no_content('Green')
    end
  end

  describe "test edit workflows" do
    it "goes to edit page and save" do
   	  trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
      visit '/'
      click_link 'Edit'
      expect(page).to have_content('Edit Train Run')
      fill_in "Route", with: "Red"
      click_button 'Save Train Run'
      expect(page).to have_content('Red')
    end

    it "goes to edit page and clicks back" do
   	  trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
      visit '/'
      click_link 'Edit'
      expect(page).to have_content('Edit Train Run')
      click_link 'Back'
      expect(page).to have_content('Chicago Train Routes')
    end
  end
end
