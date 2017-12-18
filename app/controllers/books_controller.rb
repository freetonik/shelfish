class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) do |book|
      book.user = current_user
    end
   
    if @book.save
      redirect_to @book
    else
      redirect_to root_path, notice: @book.errors.full_messages.first
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def index
    @books = Book.all
  end

  private
  def set_book
    @book = Book.find_by(id: params[:id])
    render_404 and return unless @book && User.find_by(id: @book.user_id)
  end
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :comment)
  end
end
