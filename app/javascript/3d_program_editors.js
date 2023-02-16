"use strict"
import * as THREE from "three"
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js"
import { OrbitControls} from "three/addons/controls/OrbitControls.js" 


//================initialization==================//



//-----variables-----//
const polygonId = document.getElementById("polygon").dataset.id;
const polygonSrc = document.getElementById("polygon").dataset.src;
const canvas = document.querySelector("#canvas");
const leftPanel = document.querySelector("#left-panel");
const middlePanel = document.querySelector("#middle-panel");
const rightPanel = document.querySelector("#right-panel");
const addLabelButton = document.querySelector("#addLabelButton");


const widthHalf = canvas.getBoundingClientRect().width / 2;
const heightHalf = canvas.getBoundingClientRect().height / 2;

let labels = JSON.parse(document.querySelector("#labels").dataset.labels);
// console.log(labels);
let newLabels = [];
let elements = [];

const createLabelButton = document.getElementById("create-label-button");
let createLabelButtonState = false;

const postButton = document.getElementById("post-labels-button");

//-----three.js variabels-----//
const renderer = new THREE.WebGLRenderer({canvas});
const scene = new THREE.Scene();

//-----three.js scene configurations-----//
//add camera
const fov = 60;
const aspectRation = canvas.clientWidth/canvas.clientHeight;
const near = 0.1;
const far = 1000;
const camera = new THREE.PerspectiveCamera(fov, aspectRation, near, far);
camera.position.set(0, 0, 50)
//add controller
const controller = new OrbitControls(camera, canvas);
controller.update();
//add light
const color = 0xFFFFFF;
const intensity = 1.2;
const light = new THREE.AmbientLight(color, intensity)
scene.add(light);

//-----hud canvas variables-----//
const hudCanvas = document.querySelector("#hud-canvas");
const hudContext = hudCanvas.getContext("2d");

//-----hud canvas/context configurations-----//
hudCanvas.width = canvas.getBoundingClientRect().width;
hudCanvas.height = canvas.getBoundingClientRect().height;

hudContext.strokeStyle = "green";
hudContext.lineWidth = 2;

//-----load model-----//
const url = polygonSrc;
const gltfLoader = new GLTFLoader();
gltfLoader.load(url,
  function (data) {
    scene.add(data.scene)
    // console.log("added model to the scene");
  },
  undefined,
  function (error) {
    // console.log(error);
  }
);



//-----define events-----//
canvas.addEventListener("click", (e) => {
  if(createLabelButtonState && e.target.id == "canvas") {
    onPointerClick(e);
  }
})

addLabelButton.addEventListener("click", (e) =>{
  if(createLabelButtonState) {
    addLabelButton.textContent = "Add label";
    createLabelButtonState = false;
  } else {
    addLabelButton.textContent = "Stop";
    createLabelButtonState = true;
  }
});


//-----function declarations-----//
function onPointerClick(e) {
  const raycaster = new THREE.Raycaster();
  const pointer = new THREE.Vector2();

  let rect = canvas.getBoundingClientRect();
  pointer.x = ( (e.clientX-rect.left) / canvas.clientWidth ) * 2 - 1;
	pointer.y = - ( (e.clientY-rect.top) / canvas.clientHeight ) * 2 + 1;

  // console.log(e.clientY, " / ", canvas.clientHeight);
  // console.log("x: ", pointer.x, "\ny: ", pointer.y);

  raycaster.setFromCamera(pointer, camera);

  const intersect = raycaster.intersectObjects( scene.children )[0];

  addLabelButton.textContent = "Add label";
  createLabelButtonState = false;

  let name = prompt("enter label name: ");
  if(name.length > 0){
    let newLabel = {x_coord: intersect.point.x, y_coord: intersect.point.y, z_coord: intersect.point.z, text: name};
    $.ajax({
      url: "/polygons/"+polygonId+"/labels",
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: {label: newLabel},
      success: function(response) {
        const label =  {id: response.id, x_coord: response.x_coord, y_coord: response.y_coord, z_coord: response.z_coord, text: response.text};
        labels.push(label);
        elements.push(createLabelElement());
      }
    });
  }
}

function createLabelElements() {
  let array = [];
  if(labels && labels.length > 0) {
    labels.forEach((label) => {  
      let pos = new THREE.Vector3(label.x_coord, label.y_coord, label.z_coord);
      pos.project(camera);
    
      pos.x = (pos.x * widthHalf) + widthHalf;
      pos.y = - (pos.y * heightHalf) + heightHalf;
    
      let element = document.createElement("div");
      let turboFrame = document.createElement("turbo-frame");
      let link = document.createElement("a");
      link.href = "/polygons/"+polygonId+"/labels/"+label.id+"/edit";
      link.style.color = "white";
      link.style.textDecoration = "none";
      turboFrame.appendChild(link)
      turboFrame.id = "label_" + label.id;
      turboFrame.src = "/polygons/"+polygonId+"/labels/"+label.id;
      element.appendChild(turboFrame);
      element.setAttribute("data-turbo-frame", turboFrame.id);
      element.screenPosition = pos;
      element.classList = "rounded-3";
      element.style.borderColor = label.color;
      element.label = label;
      leftPanel.appendChild(element);
      array.push(element);
    });
    return array;
  }
}

function createLabelElement() {
  if(labels && labels.length > 0) {
    const label = labels[labels.length - 1];

    let pos = new THREE.Vector3(label.x_coord, label.y_coord, label.z_coord);
    pos.project(camera);
    
    pos.x = (pos.x * widthHalf) + widthHalf;
    pos.y = - (pos.y * heightHalf) + heightHalf;
    
    let element = document.createElement("div");
    let turboFrame = document.createElement("turbo-frame");
    let link = document.createElement("a");
    link.href = "/polygons/"+polygonId+"/labels/"+label.id+"/edit";
    link.style.color = "white";
    link.style.textDecoration = "none";
    turboFrame.appendChild(link)
    turboFrame.id = "label_" + label.id;
    turboFrame.src = "/polygons/"+polygonId+"/labels/"+label.id;
    element.appendChild(turboFrame);
    element.setAttribute("data-turbo-frame", turboFrame.id);
    element.screenPosition = pos;
    element.classList = "rounded-3";
    element.style.borderColor = label.color;
    element.label = label;
    leftPanel.appendChild(element);
    return element;
  }
}

function updateScreenPositionForElementsArray() {
  const raycaster = new THREE.Raycaster();
  const dir = new THREE.Vector3();
  const target = new THREE.Vector3();
  elements.forEach((element) => {  
    let elementLabel = element.label;
    target.set(elementLabel.x_coord, elementLabel.y_coord, elementLabel.z_coord);
    dir.subVectors( target, camera.position ).normalize();
    raycaster.set(camera.position, dir);
    const intersects = raycaster.intersectObjects( scene.children, true );

    const labelDistance = camera.position.distanceTo(target);
    if( intersects[0] ) {
      // console.log("intersection: ",intersects[0].distance, "real: ", labelDistance);
      if(labelDistance < intersects[0].distance + 2) {
        element.visible = true;
      } else{
        element.visible = false;
      }
      
    }


    let pos = new THREE.Vector3(elementLabel.x_coord, elementLabel.y_coord, elementLabel.z_coord);

    pos.project(camera);
  
    pos.x = (pos.x * widthHalf) + widthHalf;
    pos.y = - (pos.y * heightHalf) + heightHalf;

    element.screenPosition = pos;
  });
}

function sortElementsArray() {
  for(let i=0; i<elements.length; i++) {
    for(let j=0; j<elements.length-1; j++) {
      let first = elements[j]
      let second = elements[j+1];
      
      if(second.screenPosition.y < first.screenPosition.y) {
        elements[j] = second;
        elements[j+1] = first;
        // console.log("YESS");
      }

    }
  }


}

function addLabelsToPanels() {
  elements.forEach( (element) => {
    if(element.visible) {
      if(element.screenPosition.x < widthHalf  && element.parentElement && element.parentElement.id == "right-panel") {
        leftPanel.appendChild(element);
      } else if(element.screenPosition.x >= widthHalf  && element.parentElement && element.parentElement.id == "left-panel"){
        rightPanel.appendChild(element);
      }
      // console.log("VISIBLE");
    }
  });
}

function drawLabelLines() {
  elements.forEach( (element) => {
    if(element.visible){
      hudContext.strokeStyle = element.label.color == null ? "white" : element.label.color;

      hudContext.beginPath();
      hudContext.moveTo(element.screenPosition.x, element.screenPosition.y);
      
      if (element.parentElement.id == "left-panel"){
        hudContext.lineTo(element.getBoundingClientRect().right - canvas.getBoundingClientRect().left, //x
        (element.getBoundingClientRect().top+element.getBoundingClientRect().bottom)/2 - canvas.getBoundingClientRect().top) //y
      }
      else {
        hudContext.lineTo(element.getBoundingClientRect().left - canvas.getBoundingClientRect().left, //x
                        (element.getBoundingClientRect().top+element.getBoundingClientRect().bottom)/2 - canvas.getBoundingClientRect().top) //y      
      }
      hudContext.stroke();
    }
  });
}

function resizeCanvasToDisplaySize() {
  camera.aspect = canvas.clientWidth / canvas.clientHeight;
  camera.updateProjectionMatrix();

  renderer.setSize( canvas.clientWidth, canvas.clientHeight );

}

//-----call functions-----//
elements = createLabelElements();
resizeCanvasToDisplaySize();




//====================Main Loop===================//
function update() {

  //call three.js rendering function
  renderer.render(scene, camera);

  if(elements && elements.length > 0) {
    hudContext.clearRect(0, 0, hudCanvas.width, hudCanvas.height);

    
    updateScreenPositionForElementsArray();
    sortElementsArray();
    addLabelsToPanels();
    drawLabelLines();

  } else {
    leftPanel.textContent = "";
    rightPanel.textContent = "";
    elements = createLabelElements();
  }

  requestAnimationFrame(update);
}

update();