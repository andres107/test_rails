# Class controller for Swagger
class ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Swagger Smart League'
      key :description, '<br>The endpoints with the parameter \'sort\' you ' \
                        'could order results of descending(-) or ascending(+)' \
                        ' form by any attribute that has the model.'
      contact do
        key :name, 'Vincoorbis Backend'
      end
    end
    tag do
      key :name, 'app-user'
      key :description, 'AppUser operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
    security_definition :api_key do
      key :type, :apiKey
      key :name, :Authorization
      key :in, :header
    end
  end

  swagger_schema :Paginator do
    property :self do
      key :type, :string
      key :example, 'http://localhost:3000/api/v1/posts?page[number]=2&page[size]=1'
      key :requiered, false
    end
    property :first do
      key :type, :string
      key :example, 'http://localhost:3000/api/v1/posts?page[number]=1&page[size]=1'
      key :requiered, false
    end
    property :prev do
      key :type, :string
      key :example, 'http://localhost:3000/api/v1/posts?page[number]=1&page[size]=1'
      key :requiered, false
    end
    property :next do
      key :type, :integer
      key :format, :int64
      key :example, 'http://localhost:3000/api/v1/posts?page[number]=3&page[size]=1'
      key :requiered, false
    end
    property :last do
      key :type, :integer
      key :format, :int64
      key :example, 'http://localhost:3000/api/v1/posts?page[number]=60&page[size]=1'
      key :requiered, false
    end
    property :totalCount do
      key :type, :integer
      key :format, :int64
      key :example, 524
      key :requiered, false
    end
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Api::V1::RestaurantsController,
    Error,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
