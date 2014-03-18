class TrainRun < ActiveRecord::Base
	validates :train_line, presence: true
	validates :route, presence: true
	validates :run_number, presence: true
	validates :operator_id, presence: true
end
