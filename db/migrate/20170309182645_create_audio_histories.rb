class CreateAudioHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_histories do |t|
      t.integer :audio_clip_id
      t.macaddr :mac_address

      t.timestamps
    end
  end
end
