class BooksController < ApplicationController
before_action :set_detail, only: [:show, :edit, :update]
  def top
  end

  def index
    @lists = Book.all
    @create = Book.new
  end

  def create
    @create = Book.new(list_params)
    if @create.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@create.id)
    else
      @lists = Book.all
      render :index
    end
  end

  def show
    # @detail = Book.find(params[:id])
  end

  def edit
    # @detail = Book.find(params[:id])
  end

  def update
    # @detail = Book.find(params[:id])
    if @detail.update(list_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@detail.id)
    else
      render :edit
    end
  end

  def destroy
    @kill = Book.find(params[:id])
    @kill.destroy
    redirect_to books_path
    flash[:notice] = 'Book was successfully destroyed.'
  end

  private

  def set_detail
    @detail = Book.find(params[:id])
  end

  # ストロングパラメータ
  def list_params
    params.require(:book).permit(:title, :body)
  end

end