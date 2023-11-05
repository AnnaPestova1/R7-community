class CreateForums < ActiveRecord::Migration[7.0]
  def change
    create_table :forums do |t|
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
