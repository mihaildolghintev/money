class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :expense_category, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
