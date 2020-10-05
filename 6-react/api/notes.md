- skip_before_action :verify_authenticity_token

- requrie'ı kaldır

- temp/scaffolded rails

- To set default response to the JSON
class ApiController < ApplicationController
  before_action :set_default_format

  private

    def set_default_format
      request.format = :json
    end
end