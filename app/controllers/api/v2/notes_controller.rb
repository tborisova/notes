class Api::V2::NotesController < Api::V1::NotesController

  def index
    @notes = Note.not_expired.includes(:labels).ransack(params[:q]).result

    render json: @notes.to_json(include: :labels)
  end
end
