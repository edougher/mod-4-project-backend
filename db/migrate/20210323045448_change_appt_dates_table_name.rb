class ChangeApptDatesTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :appt_dates, :dates
  end
end
