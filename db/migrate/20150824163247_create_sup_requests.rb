class CreateSupRequests < ActiveRecord::Migration
  def change
    create_table :sup_requests do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message
      t.string :is_done

      t.timestamps null: false
    end
  end
end
