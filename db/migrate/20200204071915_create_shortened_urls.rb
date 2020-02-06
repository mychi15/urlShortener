class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :token, unique: true

      t.timestamps
    end

    add_index :shortened_urls, :token, unique: true
  end
end
