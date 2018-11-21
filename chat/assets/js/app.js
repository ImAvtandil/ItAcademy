// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
// import "phoenix_html"


document.getElementById("name").oninput = function(ev){
    window.userToken = document.getElementById("name").value;
}


// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

let channel = socket.channel("room:chat", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("new_message", data=>{
    console.log(data);
    drovMessage(data);
    document.getElementById("message").value = "";
});

channel.on("message_list", data=>{
    console.log(data);
    data.messages.forEach(function(element){
        drovMessage(element);
    });
});

document.getElementById("send").onclick = function(e){
    let text = document.getElementById("message").value;
    let author = document.getElementById("name").value;
    if(text!=""){
        channel.push("new_message", {"text": text, "author": author});
    }else{
        alert("Твої думки мені не ясні. Введи текст");
    }
}

function drovMessage(data){
    let div = document.createElement("div");
    div.setAttribute("class", "message");
    div.innerText = data.author+": "+data.text;
    document.getElementById("history").appendChild(div);
}


