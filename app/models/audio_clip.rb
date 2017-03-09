class AudioClip < ApplicationRecord
  has_attached_file :clip
  validates_attachment_content_type :clip,
    :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  
  has_many :audio_history
end
