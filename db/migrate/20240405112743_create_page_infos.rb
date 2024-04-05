class CreatePageInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :page_infos do |t|
      t.string :page_type
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
