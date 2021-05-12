class PagesController < ApplicationController     # extend from application controller

    # action or method
    def home
        redirect_to articles_path if logged_in?
    end

    def about
    end
end