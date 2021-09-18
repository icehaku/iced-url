class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.references :slug, null: false, foreign_key: true
      t.text :remote_ip

      t.timestamps
    end
  end
end
