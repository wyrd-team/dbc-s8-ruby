class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.date :expired_on
      t.integer :priority
      t.integer :status
      t.references :user_id, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
