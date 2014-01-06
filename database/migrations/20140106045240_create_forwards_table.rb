class CreateForwardsTable < ActiveRecord::Migration
  def change
   create_table :forwards do |t|
      t.string :long_url
      t.timestamps
    end
  end
end
