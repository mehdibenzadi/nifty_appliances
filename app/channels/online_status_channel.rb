class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    onlinestatus = OnlineStatus.find(params[:id])
    stream_for onlinestatus
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
