class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.includes(:labels).ransack(params[:q]).result

    render json: @notes.to_json(include: :labels)
  end

  def show
    render json: @note.to_json(includes: :labels)
  end

  def new
    @note = Note.new

    render json: @note
  end

  def edit
    
    render json: @note.to_json(includes: :labels)
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note
    else
      render json: @note.errors
    end
  end

  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors
    end
  end

  def destroy
    @note.destroy

    render json: :no_content
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
