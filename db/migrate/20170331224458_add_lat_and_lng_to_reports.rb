class AddLatAndLngToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :lat, :string
    add_column :reports, :lng, :string
  end
end
