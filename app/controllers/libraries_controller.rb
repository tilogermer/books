class LibrariesController < ApplicationController
  before_action :find_library, only: [:show, :edit, :update, :destroy]
  
  def index
    @libraries = Library.all.order("name ASC")
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      flash[:notice] = "Library Created"
      redirect_to libraries_path
    else
      render 'new'
    end
  end

  def show
    @books = @library.books
  end

  def edit
  end

  def update
    @library.update(library_params)
    flash[:notice] = "Library updated"
    redirect_to libraries_path
  end

  def destroy
    @library.destroy
    flash[:notice] = "Library removed"
    redirect_to libraries_path
  end

  private
  def library_params
    params.require(:library).permit(:name)
  end

  def find_library
    @library = Library.find(params[:id])
  end
end