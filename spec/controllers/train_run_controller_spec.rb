require 'spec_helper'

describe TrainRunController do
	describe "GET index" do

		it "assigns train_runs" do
			tr=TrainRun.create({ route: "R1", train_line: "Green", run_number: "A5", operator_id: "billy" })
	      	get :index
	      	expect(assigns(:train_runs)).to eq([tr])
		end

		it "doesn't allow empty records" do
			tr=TrainRun.create
	      	get :index
	      	expect(assigns(:train_runs)).to eq([])
		end

		it "gives records in alphabetical order by run number" do
			trainrun1=TrainRun.create({ route: "R1", train_line: "Green", run_number: "B", operator_id: "billy" })
			trainrun2=TrainRun.create({ route: "R1", train_line: "Green", run_number: "A", operator_id: "billy" })
	      	get :index
	      	expect(assigns(:train_runs)).to eq([trainrun2,trainrun1])
		end
	
	end
end
