class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities  do |t|
      t.string :resource
      t.string :activity
    end
  end

  remove_column :roles, :activities

end
