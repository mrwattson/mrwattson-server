module MrWattsonRaspberry
  module Endpoints
    # Main mount point for all the endpoints
    class Base < Grape::API
      version 'v1', using: :path, vendor: 'MrWattsonRaspberry'
      format :json

      mount About
    end
  end
end
