class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET notebooks/1/chapters
  def index
    @chapters = @notebook.chapters
  end

  # GET notebooks/1/chapters/1
  def show
  end

  # GET notebooks/1/chapters/new
  def new
    @chapter = @notebook.chapters.build
  end

  # GET notebooks/1/chapters/1/edit
  def edit
  end

  # POST notebooks/1/chapters
  def create
    @chapter = @notebook.chapters.build(chapter_params)

    if @chapter.save
      redirect_to(@chapter.notebook)
    else
      render action: 'new'
    end
  end

  # PUT notebooks/1/chapters/1
  def update
    if @chapter.update(chapter_params)
      redirect_to notebook_chapter_path(@chapter.notebook, @chapter)
    else
      render action: 'edit'
    end
  end

  # DELETE notebooks/1/chapters/1
  def destroy
    @chapter.destroy

    redirect_to @notebook
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = current_user.notebooks.find(params[:notebook_id])
    end

    def set_chapter
      @chapter = @notebook.chapters.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chapter_params
      params.require(:chapter).permit(:name, :description, :status, :notebook_id)
    end
end
