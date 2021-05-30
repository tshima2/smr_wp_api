module Api
  module V1
    
    class WaitingPointsController < ApplicationController
      before_action :set_waiting_point, only: [:show, :update, :destroy]

      def index
        waiting_points = WaitingPoint.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded waiting_points', data: waiting_points }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the waiting_point', data: @waiting_point }
      end

      def create
        waiting_point = WaitingPoint.new(waiting_point_params)
        if waiting_point.save
          render json: { status: 'SUCCESS', data: waiting_point }
        else
          render json: { status: 'ERROR', data: waiting_point.errors }
        end        
      end

      def destroy
        @waiting_point.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the waiting_point', data: @waiting_point }        
      end

      def update
        if @waiting_point.update(waiting_point_params)
          render json: { status: 'SUCCESS', message: 'Updated the waiting_point', data: @waiting_point }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @waiting_point.errors }
        end
      end

      private
      def set_waiting_point
        @waiting_point = WaitingPoint.find(params[:id])
      end

      def waiting_point_params
        params.require(:waiting_point).permit(:name, :memo, :geog)
      end
    end


  end
end


