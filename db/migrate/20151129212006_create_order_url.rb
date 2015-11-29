class CreateOrderUrl < ActiveRecord::Migration
  def change
    create_table :order_urls, id: :uuid do |t|
      t.uuid :user_id
      t.text :order_url
    end
  end
end
