import consumer from "./consumer";

const initOnlineChannel = () => {
  // Selection en JS de tous les tag online / offline (voir _online_status_button.html.erb)
  let onlineStatusButtons = document.querySelectorAll(".status-button");

  // Setup subscriber pour chacun des boutons
  onlineStatusButtons.forEach(button => {
    const id = button.dataset.onlineStatusId;
    consumer.subscriptions.create({ channel: "OnlinestatusChannel", id: id }, {
      received(data) {
        onlineStatusButtons = document.querySelectorAll(".status-button")
        const badge = [...onlineStatusButtons].find(statusButton => statusButton.dataset.onlineStatusId === id)
        badge.outerHTML = data;
        console.log(data);
      },
    });
  });
}

export default initOnlineChannel;

