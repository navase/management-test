class RenameRegistrationsToRecords < ActiveRecord::Migration
  def change
    rename_table :registrations, :records
  end
end
