var labSubSectionId;

if(document.getElementById('formModal') != null) {
  var formModal = document.getElementById('formModal')
  formModal.addEventListener('show.bs.modal', function (event) {
    const form = document.querySelector("#form");
    form.action = "/lab_sub_sections/"+labSubSectionId+"/images";
  })
}



//scale buttons

function waitForElm(selector) {
    return new Promise(resolve => {
        if (document.querySelector(selector)) {
            return resolve(document.querySelector(selector));
        }

        const observer = new MutationObserver(mutations => {
            if (document.querySelector(selector)) {
                resolve(document.querySelector(selector));
                observer.disconnect();
            }
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    });
}
if(document.querySelector(".trigger")) {
  Array.from(document.querySelectorAll(".trigger")).forEach( (element) => {
    element.addEventListener("click", (e) => {
      waitForElm('#imagesParent').then((elm) => {
        labSubSectionId = elm.parentElement.id;  
        let nodes = elm.getElementsByTagName("div");
      
        const scaleUpButton = document.getElementById("scaleUpButton");
        const scaleToFitButton = document.getElementById("scaleToFitButton");
        const scaleDownButton = document.getElementById("scaleDownButton");
        
        scaleUpButton.addEventListener("click", (e) => {
          console.log(nodes);
          for(var i=0; i<nodes.length; i++) {
            nodes[i].style.height = (parseInt(nodes[i].style.height.match(/[0-9]+/)[0]) + 10) + "vh";
          }
        })
      
        scaleToFitButton.addEventListener("click", (e) => {
          console.log(nodes);
          for(var i=0; i<nodes.length; i++) {
            nodes[i].style.height = "90vh";
          }
        })
      
        scaleDownButton.addEventListener("click", (e) => {
          console.log(nodes);
          for(var i=0; i<nodes.length; i++) {
            nodes[i].style.height = (parseInt(nodes[i].style.height.match(/[0-9]+/)[0]) - 10) + "vh";
          }
        })
      
      });
    })
  });
}

var closeButton = document.getElementById("closeButton");
if(closeButton) {
  closeButton.addEventListener("click", (e) => {
    document.getElementById("content_frame").innerHTML = "";
  })
}