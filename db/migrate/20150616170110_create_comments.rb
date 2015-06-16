class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter_name
      t.text :body
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
