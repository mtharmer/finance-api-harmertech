class StatusController < ApplicationController
  def index
    render plain: 'success', status: :ok
  end
end
