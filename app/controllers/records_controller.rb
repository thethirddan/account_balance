class RecordsController < ApplicationController
  def create
      @record = Record.new(record_params)

      if @record.save
        render json: @record
      else
        render json: @record.errors, status: :unprocessable_entity
      end
    end

  def index
    @records = Record.all
  end

  private

  def record_params
    params.require(:record).permit(:title, :amount, :date)
  end
end
