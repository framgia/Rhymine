class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
