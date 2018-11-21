class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :code
      t.string :otk_session_id
      t.string :otk_token_id
      t.timestamps
    end
  end
end
