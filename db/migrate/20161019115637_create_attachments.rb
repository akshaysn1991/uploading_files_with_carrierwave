class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachment
      t.string :location
      t.string :data_type
      t.string :original_filename
      t.string :content_type
      t.timestamps null: false
    end
  end
end
