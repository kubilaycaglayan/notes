class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :person
      t.references :pet

      t.timestamps
    end
  end
end
