class AudioHistoryController < ApplicationController
  def save
    clip = AudioClip.find(params[:id])
    ah = AudioHistory.new
    ah.mac_address = params[:mac_address]
    clip.audio_history << ah
    ah.save
    # TODO error handling
    render :nothing => true
  end
end
