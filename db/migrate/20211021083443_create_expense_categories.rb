class CreateExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_categories do |t|
      t.string :name

      t.timestamps
    end

    add_index :expense_categories, :name, unique: true
  end
end
