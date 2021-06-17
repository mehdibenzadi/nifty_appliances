import consumer from "./consumer";

const initOnlinestatusCable = () => {
  console.log("Hello Mathis");
  const onlineStatusButtons = document.querySelectorAll('offlinebutton');

  onlineStatusButtons.forEach((element) => {
    const id = element.dataset.onlineStatusId;

    consumer.subscriptions.create({ channel: "OnlinestatusChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  })
}

export { initOnlinestatusCable };
