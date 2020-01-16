# frozen_string_literal: true

class CreateRepositoryStatusItems < ActiveRecord::Migration[6.0]
  def up
    create_table :repository_status_items do |t|
      t.string :status, null: false
      t.string :icon, null: false
      t.references :repository, null: false, foreign_key: true
      t.references :repository_column, null: false, foreign_key: true
      t.references :created_by, index: true, foreign_key: { to_table: :users }, null: true
      t.references :last_modified_by, index: true, foreign_key: { to_table: :users }, null: true

      t.timestamps
    end

    add_gin_index_without_tags :repository_status_items, :data
  end

  def down
    drop_table :repository_status_items
  end
end
