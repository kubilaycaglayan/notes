class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :party
      t.references :user
      t.boolean :joining

      t.timestamps
    end
  end
end
