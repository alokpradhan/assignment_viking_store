class CreateBillingInfos < ActiveRecord::Migration
  def change
    create_table :billing_infos do |t|
      t.integer :user_id
      t.string :phone_number
      t.string :cc_type
      t.string :cc_number
      t.string :cc_expiry
      t.integer :address_id
      t.timestamps null: false
    end
  end
end
