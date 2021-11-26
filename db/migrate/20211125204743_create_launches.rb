class CreateLaunches < ActiveRecord::Migration[6.0]
  def change
    create_table :launches do |t|
      t.string :launch_id
      t.string :provider
      t.references :article, null: false, foreign_key: true
    end
  end
end
