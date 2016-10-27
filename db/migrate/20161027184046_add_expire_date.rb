class AddExpireDate < ActiveRecord::Migration
  def change
    add_column :notes, :expire_date, :datetime
  end
end
