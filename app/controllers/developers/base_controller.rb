# frozen_string_literal: true

module Developers
  class BaseController < ApplicationController
    before_action :set_developer

    private

    def set_developer
      @developer = Developer.find(params[:id])
    end
  end
end
