class NotesController < ApplicationController
  def index
    @notes = Note.all
    @new_notes = Note.new
  end

  def show
  end

  def new
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.'}
        format.js {}
        format.json { render json: @note, status: :created, location: @note}
      else
        format.html { render action: "new"}
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    head :ok
  end

  def destroy
    @note = Note.find(params[:id]).destroy
    head :ok
    #return 200 status after ajax destroy
  end

  private
    def note_params
      params.require(:note).permit(:title, :comment)
    end

end
