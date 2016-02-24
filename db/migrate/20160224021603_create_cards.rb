class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.date :date
      t.time :start
      t.time :end
      t.time :reststart
      t.time :restend

      t.timestamps null: false
    end
  end
end
