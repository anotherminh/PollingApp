class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id
      t.text :choice

      t.timestamps
    end

    add_index :answer_choices, [:question_id, :choice], unique: true
    add_index :answer_choices, :question_id
  end
end
