class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :category
      t.string :answer_type

      t.timestamps
    end
  end
end
