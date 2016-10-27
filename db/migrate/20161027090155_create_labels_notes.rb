class CreateLabelsNotes < ActiveRecord::Migration
  def change
    create_table :labels_notes do |t|
      t.integer :label_id
      t.integer :note_id
      t.index :label_id
      t.index :note_id
    end
  end
end
