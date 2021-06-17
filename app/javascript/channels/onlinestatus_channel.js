import consumer from "./consumer";
const initOnlinestatusCable = () => {
  console.log("Hello Mathis");
  const onlineStatusButtons = document.getElementsByClassName("offlinebutton")
  console.log(onlineStatusButtons)
  console.log(typeof onlineStatusButtons)
  for (let status of onlineStatusButtons) {
    const id = status.dataset.onlineStatusId;
    consumer.subscriptions.create({ channel: "OnlinestatusChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
  /*onlineStatusButtons.forEach((element) => {
    const id = element.dataset.onlineStatusId;
    console.log(id);
    consumer.subscriptions.create({ channel: "OnlinestatusChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }) */
}

export { initOnlinestatusCable };
