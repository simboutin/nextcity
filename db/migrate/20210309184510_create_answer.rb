class CreateAnswer < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :comment
      t.references :city_comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
