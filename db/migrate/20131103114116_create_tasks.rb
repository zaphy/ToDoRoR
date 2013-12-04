class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :category
      t.string :author
      t.string :short_text
      t.string :detailed_text
      t.date :deadline
      t.float :effort_estimation

      t.timestamps
    end
  end
end
