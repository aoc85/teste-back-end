class TrackingsController < ApplicationController

  def index
    @tracker = false
    @trackings = Tracking.last(50).reverse
  end

  def create
    @tracking = Tracking.new(tracking_params)

    respond_to do |format|
      if @tracking.save
        format.json { head :created, location: @trackings }
      else
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def tracking_params
      params.require(:tracking).permit(:url, :uuid)
    end
end
