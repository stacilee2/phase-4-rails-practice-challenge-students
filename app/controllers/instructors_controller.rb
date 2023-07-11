class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        instructors = Instructor.all
        render json: instructors 
    end
    
    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create!(name: params[:name])
        render json: instructor, status: :created
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update(name: params[:name])
        render json: instructor
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        instructor.destroy
        head :no_content
    end

    private

    def render_not_found_response
        render json: { error: "Instructor not found" }, status: :not_found
    end

end
