class AddDateColumnToMeeting < ActiveRecord::Migration[6.0]
  def change
  	add_column :meetings, :date, :string
  end
end
