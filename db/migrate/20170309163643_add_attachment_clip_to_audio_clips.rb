class AddAttachmentClipToAudioClips < ActiveRecord::Migration
  def self.up
    change_table :audio_clips do |t|
      t.attachment :clip
    end
  end

  def self.down
    remove_attachment :audio_clips, :clip
  end
end
