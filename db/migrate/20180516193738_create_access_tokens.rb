class CreateAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :access_tokens, id: :uuid do |t|
      t.belongs_to :member, type: :uuid, null: true, foreign_key: true
      t.text :name, null: false
      t.timestamp :created_at
    end
  end
end
