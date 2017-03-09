class CreateAudioClips < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_clips do |t|
      t.string :title
      t.binary :clip
      t.integer :color
      t.date :clip_date

      t.timestamps
    end
  end
end
