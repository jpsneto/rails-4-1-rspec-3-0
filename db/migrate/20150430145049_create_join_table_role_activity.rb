class CreateJoinTableRoleActivity < ActiveRecord::Migration
  def change
    create_join_table :roles, :activities do |t|
      # t.index [:role_id, :activity_id]
      # t.index [:activity_id, :role_id]
    end
  end
end
