if(localStorage) {
  let uuid = localStorage.getItem("_iCaseiUUID");
  if(uuid === null){
      localStorage.setItem("_iCaseiUUID", generateUuidv4());
  }
}

function generateUuidv4() {
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  )
}

fetch('http://localhost:3000/trackings', {
  headers: { "Content-Type": "application/json; charset=utf-8" },
  method: 'POST',
  body: JSON.stringify({
    url: this.window.location.pathname,
    uuid: localStorage.getItem("_iCaseiUUID")
  })
});
