class AddAudioToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :audio, :string
  end
end
