module Api  
  module V1

    class ExperiencesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_candidate, only: [ :show, :update, :destroy ]

      # GET /experiences
      def index
        @experiences = current_user.experiences.all

        render json: @experiences
      end

      # GET /experiences/1
      def show
        render json: @experience
      end

      # POST /experiences
      def create
        @experience = current_user.experiences.build(experience_params)

        if @experience.save
          render json: @experience, status: :created, location: @experience
        else
          render json: @experience.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /experiences/1
      def update
        if @experience.update(experience_params)
          render json: @experience
        else
          render json: @experience.errors, status: :unprocessable_entity
        end
      end

      # DELETE /experiences/1
      def destroy
        @experience.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_experience
          @experience = current_user.experiences.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def experience_params
          params.require(:experience).permit(:title, :year, :candidate_id, :users_id)
        end
    end
end
