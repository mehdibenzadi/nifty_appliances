import {initOnlineStatusCable} from "../channels/onlinestatus_channel";

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initOnlineStatusCable();
});
