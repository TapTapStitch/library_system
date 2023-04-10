# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :user_is_librarian?, only: %i[new edit create update destroy]

  def index
    @books = SearchBooks.new(Book.all.order(id: :desc), search_params).call
    @books_count = @books.length.to_s
    @pagy, @books = pagy(@books)
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def user
    @books = current_user.books
  end

  def borrow
    @book = Book.find(params[:id])
    if @book.available?
      borrow = Borrow.new(book: @book, user: current_user)
      if borrow.save
        @book.update(status: :borrowed)
        redirect_to @book, notice: 'Book has been borrowed.'
      else
        redirect_to @book, alert: borrow.errors.full_messages.to_sentence
      end
    else
      redirect_to @book, alert: 'Book is not available.'
    end
  end

  def return
    @book = Book.find(params[:id])

    if (current_user.librarian? || current_user.admin?) || current_user.books.include?(@book)
      Borrow.find_by(book_id: @book.id).destroy
      redirect_to @book, notice: 'Book has been returned.'
    else
      redirect_to @book, alert: 'Book cannot be returned.'
    end
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :ISBN, :published_date)
  end

  def search_params
    params.permit(:title, :author, :description, :ISBN, :status)
  end
end
