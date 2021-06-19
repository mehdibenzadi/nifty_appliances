class OnlinestatusChannel < ApplicationCable::Channel
  def subscribed
    # p "subscribe"
    # stream_from "some_channel"
    onlinestatus = Onlinestatus.find(params[:id])
    p onlinestatus
    stream_for onlinestatus
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
