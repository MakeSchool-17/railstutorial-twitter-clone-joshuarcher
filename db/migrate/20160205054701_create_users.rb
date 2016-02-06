class CreateUsers < ActiveRecord::Migration
  def change
    # used when migration failed due to table already existing
    # drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
