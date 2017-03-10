class AudioClipsController < ApplicationController
  before_action :set_audio_clip, only: [:show, :edit, :update, :destroy]

  def is_there_new_clip
    result = []
    AudioClip.where('clip_date > ?', 7.days.ago).order(:clip_date).each do |clip|
      already_seen = AudioHistory.where('mac_address = ?', params[:mac_address]).where('audio_clip_id = ?', clip.id)
      if already_seen.length == 0
        result << clip
      end
    end
    render json: result
  end
  
  def get_latest_unread
    clip_path = nil
    AudioClip.where('clip_date > ?', 7.days.ago).order(:clip_date).each do |clip|
      result = AudioHistory.where('mac_address = ?', params[:mac_address]).where('audio_clip_id = ?', clip.id)
      if result.length == 0
        clip_path = clip.clip.path
        ah = AudioHistory.new
        ah.mac_address = params[:mac_address]
        clip.audio_history << ah
        ah.save
        break
      end
    end
    if clip_path != nil
      send_file clip_path, type: 'audio/mpeg', filename: 'clip.mp3'
    else
      # Return a 204 (No Content) is nothing available
      render :nothing => true, :status => :no_content
    end
  end
  
  # GET /audio_clips
  # GET /audio_clips.json
  def index
    @audio_clips = AudioClip.all
  end

  # GET /audio_clips/1
  # GET /audio_clips/1.json
  def show
  end

  # GET /audio_clips/new
  def new
    @audio_clip = AudioClip.new
  end

  # GET /audio_clips/1/edit
  def edit
  end

  # POST /audio_clips
  # POST /audio_clips.json
  def create
    @audio_clip = AudioClip.new(audio_clip_params)

    respond_to do |format|
      if @audio_clip.save
        format.html { redirect_to @audio_clip, notice: 'Audio clip was successfully created.' }
        format.json { render :show, status: :created, location: @audio_clip }
      else
        format.html { render :new }
        format.json { render json: @audio_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_clips/1
  # PATCH/PUT /audio_clips/1.json
  def update
    respond_to do |format|
      if @audio_clip.update(audio_clip_params)
        format.html { redirect_to @audio_clip, notice: 'Audio clip was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_clip }
      else
        format.html { render :edit }
        format.json { render json: @audio_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_clips/1
  # DELETE /audio_clips/1.json
  def destroy
    @audio_clip.destroy
    respond_to do |format|
      format.html { redirect_to audio_clips_url, notice: 'Audio clip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_clip
      @audio_clip = AudioClip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_clip_params
      params.require(:audio_clip).permit(:title, :clip, :color, :clip_date)
    end
end
