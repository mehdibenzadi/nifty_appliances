import consumer from "./consumer";

/* const initOnlineChannel = () => {
  console.log("Hello Mathis");
  const onlineStatusButtons = document.querySelectorAll(".badge.badge-light-danger, .badge.badge-light-success");
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
}
 */
const initOnlineChannel = () => {
  const onlineStatusButtons = document.querySelectorAll(".badge.badge-light-danger, .badge.badge-light-success");
  onlineStatusButtons.forEach(button => {
    const id = button.dataset.onlineStatusId;
    consumer.subscriptions.create({ channel: "OnlinestatusChannel", id: id }, {
      received(data) {
        button.outerHTML = data;
      },
    });
  });
}


const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
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

  export default initOnlineChannel;

