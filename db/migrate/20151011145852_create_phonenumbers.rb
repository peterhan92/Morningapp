class CreatePhonenumbers < ActiveRecord::Migration
  def change
    create_table :phonenumbers do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
