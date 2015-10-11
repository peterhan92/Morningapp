class CreatePhonenumbers < ActiveRecord::Migration
  def change
    create_table :phonenumbers do |t|
      t.integer :number, :limit => 5

      t.timestamps null: false
    end
  end
end
