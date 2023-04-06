# frozen_string_literal: true

module BooksHelper
  def show_link?
    controller.controller_name == 'books' && controller.action_name == 'index'
  end
end
