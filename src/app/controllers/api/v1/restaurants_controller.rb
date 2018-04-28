# Controller Statos
module Api
  module V1
    class RestaurantsController < ApplicationController
      include Swagger::Blocks
      before_action :validation, only: %i[index]

      swagger_path '/api/v1/restaurants/statistics' do
        operation :get do
          key :description, 'Returns statistics data'
          key :produces, [
            'application/json'
          ]
          key :tags, [
            'statistics'
          ]

          parameter do
            key :name, :latitude
            key :in, :query
            key :description, 'Latitude to search'
            key :required, true
            key :type, :float
          end

          parameter do
            key :name, :longitude
            key :in, :query
            key :description, 'Longitude to search'
            key :required, true
            key :type, :float
          end

          parameter do
            key :name, :radius
            key :in, :query
            key :description, 'Latitude to search'
            key :required, true
            key :type, :float
          end
          response 200 do
            key :description, 'Success'
            schema do
              property :count do
                key :type, :integer
                key :example, '3'
                key :description, 'restaurants that fall'\
                'inside the circle with center [x,y] y radius z,'
              end
              property :avg do
                key :type, :float
                key :example, '3.0'
                key :description, 'Average rating of restaurant'\
                'inside the circle'
              end
              property :std do
                key :type, :integer
                key :example, '3'
                key :description, 'std: Standard deviation o'\
                'rating of restaurants inside the circle'
              end
            end
          end
          response :Errors do
             key :description, 'unexpected error'
             schema do
               key :'$ref', :ErrorModel
             end
          end
        end
      end

      def statistics
        data = Restaurant.what_restaurants_are_here(
          @latitude,
          @longitude,
          @radius
        )
        render json: data.to_json
      end
    
      private
    
      def validation
        param! :latitude, Float, required: true
        param! :longitude, Float, required: true
        param! :radius, Float, required: true
        @latitude = params[:latitude]
        @longitude = params[:longitude]
        @radius = params[:radius]
      end
    end
  end
end
