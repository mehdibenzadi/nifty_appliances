var myModal = document.getElementById('repairer_add_modal')
var myInput = document.getElementById('modal_click')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})