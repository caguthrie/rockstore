json.extract! audio_clip, :id, :title, :clip, :color, :clip_date, :created_at, :updated_at
json.url audio_clip_url(audio_clip, format: :json)
