class AddUserRefToTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.belongs_to :user
    end
  end
end
