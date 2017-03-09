require 'test_helper'

class AudioClipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_clip = audio_clips(:one)
  end

  test "should get index" do
    get audio_clips_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_clip_url
    assert_response :success
  end

  test "should create audio_clip" do
    assert_difference('AudioClip.count') do
      post audio_clips_url, params: { audio_clip: { clip: @audio_clip.clip, clip_date: @audio_clip.clip_date, color: @audio_clip.color, title: @audio_clip.title } }
    end

    assert_redirected_to audio_clip_url(AudioClip.last)
  end

  test "should show audio_clip" do
    get audio_clip_url(@audio_clip)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_clip_url(@audio_clip)
    assert_response :success
  end

  test "should update audio_clip" do
    patch audio_clip_url(@audio_clip), params: { audio_clip: { clip: @audio_clip.clip, clip_date: @audio_clip.clip_date, color: @audio_clip.color, title: @audio_clip.title } }
    assert_redirected_to audio_clip_url(@audio_clip)
  end

  test "should destroy audio_clip" do
    assert_difference('AudioClip.count', -1) do
      delete audio_clip_url(@audio_clip)
    end

    assert_redirected_to audio_clips_url
  end
end
