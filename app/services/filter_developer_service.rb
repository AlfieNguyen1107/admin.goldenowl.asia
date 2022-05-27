# frozen_string_literal: true

class FilterDeveloperService < ApplicationService
  def initialize(params)
    super()

    @senority = params[:senority]
  end

  def call
    data = Developer.all
    data = data.filter_senority(@senority) if @senority.present?
    data
  end
end
