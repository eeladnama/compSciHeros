class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :perpatrator
      t.string :location
      t.string :desc
      t.string :email

      t.timestamps
    end
  end
end
