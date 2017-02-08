class CreateCurrentCart < ActiveRecord::Migration
  def change
    create_table :current_carts do |t|
      t.integer :user_id
      t.integer :cart_id
    end
  end
end
