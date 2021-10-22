class CreateIncomeCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :income_categories do |t|
      t.string :name

      t.timestamps
    end

    add_index :income_categories, :name, unique: true

  end
end
