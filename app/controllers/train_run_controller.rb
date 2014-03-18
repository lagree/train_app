class TrainRunController < ApplicationController

def index
	@train_runs = TrainRun.order("run_number asc")
end


end
