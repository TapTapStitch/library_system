# frozen_string_literal: true

class SearchBooks
  attr_reader :books, :params

  def initialize(books, params)
    @books = books
    @params = params
  end

  def call
    title_author
    description_isbn
    books.where!(status: params[:status]) if params[:status].present?
    @books
  end

  private

  def title_author
    books.where!('title LIKE ?', "%#{params[:title]}%") if params[:title].present?
    books.where!('author LIKE ?', "%#{params[:author]}%") if params[:author].present?
  end

  def description_isbn
    books.where!('description LIKE ?', "%#{params[:description]}%") if params[:description].present?
    books.where!(ISBN: params[:ISBN]) if params[:ISBN].present?
  end
end
