class CreateSlugs < ActiveRecord::Migration[6.1]
  def change
    create_table :slugs do |t|
      t.text :short_url, null: false, unique: true
      t.text :target_url, null: false, unique: true

      t.timestamps
    end
  end
end