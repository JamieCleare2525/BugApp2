class AddStatusToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :status, :string, default: "Reported"
  end
end
