class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :answer_range
      t.string :answer_text
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
