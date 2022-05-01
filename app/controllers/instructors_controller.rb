class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found 
rescue_from ActiveRecord::RecordInvalid, with: :uncreatable 
    def index
        render json: Instructor.all
    end 

    def  show 
    instructor = find_by
    render json: instructor
    end 

    def update 
    instructor = find_by
    instructor.update!(allowed_params)
    render json: instructor
    end 

    def create 
    instructor = Instructor.create!(allowed_params)
    render json: instructor, status: :created 
    end 

    def destroy 
    instructor = find_by 
    instructor.destroy 
    head :no_content
    end 

    private 

    def find_by 
        Instructor.find(params[:id])
    end 

    def allowed_params
        params.permit(:name)
    end 

    def not_found 
        render json: { error: "Instructor not found"}, status: :not_found 
    end 
    
    def uncreatable
        render json: { errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end 
end
