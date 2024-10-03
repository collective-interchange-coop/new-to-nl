class AddIconToBetterTogetherCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :better_together_categories, :icon, :string, null: false, default: 'fas fa-icons'
  end
end
