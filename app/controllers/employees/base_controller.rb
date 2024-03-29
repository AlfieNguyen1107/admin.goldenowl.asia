# frozen_string_literal: true

module Employees
  class BaseController < ApplicationController
    before_action :set_employee

    private

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end
  end
end
