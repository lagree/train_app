class CreateTrainRuns < ActiveRecord::Migration
  def change
    create_table :train_runs do |t|
      t.string :train_line
      t.string :route
      t.string :run_number
      t.string :operator_id

      t.timestamps
    end
  end
end
