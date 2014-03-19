require 'csv'

class TrainRunController < ApplicationController

def index
	@train_runs = TrainRun.order("run_number asc")
end

def destroy
	@train_run = TrainRun.find(params[:id])
	@train_run.destroy
	redirect_to train_run_index_path
end

def edit
	@train_run = TrainRun.find(params[:id])
end

def update
  @train_run = TrainRun.find(params[:id])

  if @train_run.update(params[:train_run].permit(:train_line, :route,:run_number,:operator_id))
    redirect_to train_run_index_path
  else
    render 'edit'
  end
end


def upload
	
  	uploaded_io = params[:routefile]
	begin
		filename='public/uploads/'+uploaded_io.original_filename

	  	#save temporary file(s) then handle csv
	  	File.open(Rails.root.join(filename), 'wb') do |file|
	    	file.write(uploaded_io.read)
		end
	    CSV.foreach(filename, { headers: true, return_headers: false, header_converters: lambda {|f| f.strip}, converters: lambda {|f| f ? f.strip : nil}}) do |row|
	   		TrainRun.where(train_line: row[0],route: row[1],run_number: row[2],operator_id: row[3]).first_or_create	   
	   	end

	rescue
	    flash.now[:notice] = "failure"
	ensure
	   	#delete file now that we are done
	   	if uploaded_io.nil? == false
	   		File.delete(Rails.root.join(filename)) rescue nil
	   	end

	   	#sort on run number in case new records were added
	 	@train_runs = TrainRun.order("run_number asc")
	   	render :index
	end
end


end
