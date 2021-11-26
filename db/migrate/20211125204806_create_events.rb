class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_id
      t.string :provider
      t.references :article, null: false, foreign_key: true
    end
  end
end
