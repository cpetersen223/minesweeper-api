# Api Version 1
module V1
  # Main super class of the Version 1
  class MainController < ApplicationController
    include Response
    include ExceptionHandler

    # Todo: Authorization and Authentication per version
  end
end
