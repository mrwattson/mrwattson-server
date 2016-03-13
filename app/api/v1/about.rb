module MrWattsonRaspberry
  module Endpoints
    # Exposes endpoints that present descriptive information
    # about the API
    class About < Grape::API
      namespace :about do
        desc 'API Description'
        get do
          {
            version: 1,
            name: 'MrWattsonRaspberry API',
            description: 'OnDevice API for MrWattson',
            vendor: 'mr.wattson',
            licence: 'GPL'
          }
        end
      end
    end
  end
end
