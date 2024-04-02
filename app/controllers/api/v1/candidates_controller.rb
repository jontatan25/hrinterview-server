module Api  
  module V1
    class CandidatesController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_candidate, only: [:show, :update, :destroy ]

      # GET /candidates
      def index
        @candidates = Candidate.all
        render json: @candidates
      end

      # GET /candidates/1
      def show
        render json: @candidate
      end

      # POST /candidates
      def create
        @candidate = current_user.candidates.build(candidate_params)
        if @candidate.save
          render json: @candidate, status: :created
        else
          render json: @candidate.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /candidates/1
      def update
        if @candidate.update(candidate_params)
          render json: @candidate
        else
          render json: @candidate.errors, status: :unprocessable_entity
        end
      end

      # DELETE /candidates/1
      def destroy
        @candidate.destroy!
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_candidate
        @candidate = Candidate.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def candidate_params
        params.require(:candidate).permit(:name)
      end
    end
  end
end
