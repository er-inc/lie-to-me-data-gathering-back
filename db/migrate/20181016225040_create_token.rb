class CreateToken < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :friendly_id
      t.string :token_id
      t.string :session_id
      t.timestamps
    end
  end
end
