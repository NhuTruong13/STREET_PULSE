class AddColumnsToAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :answer_range, :q5
    change_column :answers, :q5, :string
    rename_column :answers, :answer_text, :q6
    change_column :answers, :q6, :string
    add_column :answers, :q7, :integer
    add_column :answers, :q8, :integer
    add_column :answers, :q9, :integer
    add_column :answers, :q10, :integer
    add_column :answers, :q11, :integer
    add_column :answers, :q12, :integer
    add_column :answers, :q13, :integer
    add_column :answers, :q14, :integer
    add_column :answers, :q15, :integer
    add_column :answers, :q16, :integer
    add_column :answers, :q17, :integer
    add_column :answers, :q18, :integer
    add_column :answers, :q19, :integer
    add_column :answers, :q20, :integer
    add_column :answers, :q21, :integer
  end
end
