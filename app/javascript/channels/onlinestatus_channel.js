import consumer from "./consumer";

const initOnlineStatusCable = () => {
  const onlineStatusButtons = document.querySelectorAll('offlinebutton');

  onlineStatusButtons.forEach((element) => {
    const id = element.dataset.onlineStatusId;

    consumer.subscriptions.create({ channel: "OnlineStatusChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  })
}

export { initOnlineStatusCable };
