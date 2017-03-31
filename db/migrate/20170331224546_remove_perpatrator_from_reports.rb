class RemovePerpatratorFromReports < ActiveRecord::Migration[5.0]
  def change
    remove_column :reports, :perpatrator, :string
  end
end
