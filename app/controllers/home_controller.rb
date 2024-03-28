class HomeController < ApplicationController
    def index
        @candidates = Candidate.all
        render json: @candidates
    end
end