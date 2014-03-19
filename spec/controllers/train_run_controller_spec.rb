require 'spec_helper'

describe TrainRunController do
	describe "GET index" do

		it "assigns train_runs" do
			tr=TrainRun.create({ route: "Green", train_line: "R1", run_number: "A5", operator_id: "billy" })
	      	get :index
	      	expect(assigns(:train_runs)).to eq([tr])
		end

		it "doesn't allow empty records" do
			tr=TrainRun.create
	      	get :index
	      	expect(assigns(:train_runs)).to eq([])
		end

		it "gives records in alphabetical order by run number" do
			trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
			trainrun2=TrainRun.create({ route: "Green", train_line: "R1", run_number: "A", operator_id: "billy" })
	      	get :index
	      	expect(assigns(:train_runs)).to eq([trainrun2,trainrun1])
		end
	
	end

	describe "POST upload" do
       it "add two entries from a csv" do
       	 @file = fixture_file_upload('example.csv', 'text/csv')
         post :upload, :routefile => @file

      	 expect(assigns(:train_runs).count).to eq(2)
       end

       it "does not add duplicate entries twice" do
      	 @file = fixture_file_upload('duplicate.csv', 'text/csv')
         post :upload, :routefile => @file
      	 expect(assigns(:train_runs).count).to eq(1)
       end

       it "does not add anything for empty csv" do
      	 @file = fixture_file_upload('empty.csv', 'text/csv')
         post :upload, :routefile => @file
      	 expect(assigns(:train_runs).count).to eq(0)
       end

       it "renders index after upload" do
       		@file = fixture_file_upload('duplicate.csv', 'text/csv')
         	post :upload, :routefile => @file
			response.should render_template("index") 	        
       end

	end

	describe "POST delete" do
       it "add two entries and deletes one" do
       		trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
			trainrun2=TrainRun.create({ route: "Green", train_line: "R1", run_number: "A", operator_id: "billy" })
   	        delete :destroy, id: trainrun1
   	        get :index
	      	expect(assigns(:train_runs).count).to eq(1)
       end

        it "redirects after delete" do
       		trainrun1=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
   	        delete :destroy, id: trainrun1
			response.should redirect_to train_run_index_path 	        
       end

	end	

	describe "update" do
		it "updates a route" do
       		@trainrun=TrainRun.create({ route: "Green", train_line: "R1", run_number: "B", operator_id: "billy" })
       		post :update, id: @trainrun, train_run: { route: "Red" }
			get :index
			@trainrun=assigns(:train_runs)[0]
			expect(@trainrun[:route]).to eq("Red")
		end
	end


end
