class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      #t.string :activities, array: true, length: 30, using: 'gin', default: '{}'
      t.string :name
      t.timestamps
    end
  end
end
