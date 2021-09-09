class AddPostcodeToMuseums < ActiveRecord::Migration[6.0]
  def change
    add_column :museums, :postcode, :integer
  end
end
