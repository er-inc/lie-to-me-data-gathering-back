class CreateStudySession < ActiveRecord::Migration[5.1]
  def change
    create_table :study_sessions do |t|
      t.string :friendly_id, null: false
      t.date :date
      t.string :interviewer
      t.string :interviewed
      t.string :otk_session_id
      t.string :otk_token_interviewer
      t.string :otk_token_interviewed
      t.boolean :lies
      t.boolean :guess
      t.string :status, default: 'created'
      t.string :archive_id
      t.string :file_url
      t.timestamps
    end
  end
end
