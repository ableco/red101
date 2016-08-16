class AddQuestionLimitToTemplates < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :question_limit, :integer, null: false, default: 1
  end
end
