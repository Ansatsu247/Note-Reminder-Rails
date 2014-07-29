class NotesController < ApplicationController
  def index
    @notes = Note.all
    @new_notes = Note.new
    @update_notes = Note.new
  end

  def show
  end

  def new
  end

  def create
    @note = Note.create(note_params)
    @note.save
    redirect_to root_path
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    @note.comment = params[:note][:comment]
    @note.save
    redirect_to root_path
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    redirect_to root_path
  end

  private
    def note_params
      params.require(:note).permit(:title, :comment)
    end

end
