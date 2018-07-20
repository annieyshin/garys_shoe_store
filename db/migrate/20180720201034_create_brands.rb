class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table(:brands) do |t|
      t.column(:shoe_name, :string)
      t.column(:price, :integer)

      t.timestamps()
    end  
  end
end
