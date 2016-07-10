class ApiController < ApplicationController
  require "net/http"
  require "date"
  skip_before_action :verify_authenticity_token, only: [:gps]
  def gps
    if params[:latitude].present? && params[:longitude].present? && params[:vehicle_identifier].present? && params[:sent_at].present?
      begin
        @sent_at = DateTime.parse(params[:sent_at])
        Waypoint.create(:latitude => params[:latitude].to_f,:longitude => params[:longitude].to_f, :vehicle_id => params[:vehicle_identifier], :sent_at => @sent_at)
        render plain: "", status: 200
      rescue
        render plain: "sent_at parameter not a date", status: 400
      end
    else
      @param_return = ""
      if !params[:latitude].present?
        @param_return.concat("missing latitude parameter, ")
      end

      if !params[:longitude].present?
        @param_return.concat("missing longitude parameter, ")
      end

      if !params[:vehicle_identifier].present?
        @param_return.concat("missing vehicle_identifier parameter, ")
      end

      if !params[:sent_at].present?
        @param_return.concat("missing sent_at parameter")
      end

      render plain:@param_return, status: 400
    end
  end
end
