class NotesController < ApplicationController

  before_action :set_note, only: [:show, :update, :edit, :destroy]

  def set_note
    @note = Note.find_by(id: params[:id])
  end

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new

    @note.content = params[:note][:content]

    if @note.save
      respond_to do |format|
        format.html { redirect_to notes_url, notice: "Note created successfully." }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js   { render js: 'alert("NOOooooo.");' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @note.content = params[:note][:content]

    if @note.save
      respond_to do |format|
        format.html { redirect_to notes_url, notice: "Note updated successfully." }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.js   { render js: 'alert("NOOooooo.");' }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note deleted." }
      format.js
    end
  end
end
