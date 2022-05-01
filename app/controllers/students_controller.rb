class StudentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found 
  rescue_from ActiveRecord::RecordInvalid, with: :uncreatable 
      def index
          render json: Student.all
      end 
  
      def  show 
      student = find_by
      render json: instructor
      end 
  
      def update 
      student = find_by
      student.update!(allowed_params)
      render json: student 
      end 
  
      def create 
      student = Student.create!(allowed_params)
      render json: student, status: :created 
      end 
  
      def destroy 
      student = find_by 
      student.destroy 
      head :no_content
      end 
  
      private 
  
      def find_by 
          Student.find(params[:id])
      end 
  
      def allowed_params
          params.permit(:name, :major, :age)
      end 
  
      def not_found 
          render json: { error: "Student not found"}, status: :not_found 
      end 
      
      def uncreatable
          render json: { errors: exception.record.errors.full_messages}, status: :unprocessable_entity
      end 
  
end
