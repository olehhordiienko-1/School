# frozen_string_literal: true

class PersonalCabinetController < ApplicationController
  before_action :authenticate_user!
  def show
    # ignored
  end
end
