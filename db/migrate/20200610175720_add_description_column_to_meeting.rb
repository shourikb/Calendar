class AddDescriptionColumnToMeeting < ActiveRecord::Migration[6.0]
  def change
  	add_column :meetings, :description, :string
  end
end
