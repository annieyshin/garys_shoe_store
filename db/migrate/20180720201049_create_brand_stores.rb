class CreateBrandStores < ActiveRecord::Migration[5.2]
  def change
    create_table(:brands_stores) do |t|
      t.column(:name_id, :integer)
      t.column(:shoe_name_id, :integer)
    end
  end
end
