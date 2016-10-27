class Api::V1::LabelsController < ApplicationController

  def create
    note = Note.find_by_id(note_id)

    if note
      note.labels.create(name: label_name)
      render json: note.to_json(include: :labels)
    else
      render json: :no_content
    end
  end

  def destroy
    note = Note.find_by_id(note_id)

    note.labels.where(id: label_id).destroy_all

    render json: note.labels
  end

  private

  def label_id
    params[:id]
  end

  def note_id
    params[:note_id]
  end
  
  def label_name
    params.require(:label).permit(:name)
  end
end