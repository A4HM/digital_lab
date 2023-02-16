"use strict"
import * as THREE from "three"
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js"
import { OrbitControls} from "three/addons/controls/OrbitControls.js" 


//================initialization==================//



//-----variables-----//
const canvas = document.querySelector("#canvas");
const leftPanel = document.querySelector("#left-panel");
const middlePanel = document.querySelector("#middle-panel");
const rightPanel = document.querySelector("#right-panel");
let turboFramesId = [];

const widthHalf = canvas.getBoundingClientRect().width / 2;
const heightHalf = canvas.getBoundingClientRect().height / 2;

const labels = JSON.parse(document.querySelector("#labels").dataset.labels);
let newLabels = [];
let elements = [];

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
camera.name = "camera";
camera.position.set(0, 0, 50)
//add controller
const controller = new OrbitControls(camera, canvas);
controller.update();
//add light
const color = 0xFFFFFF;
const intensity = 1.0;
const light = new THREE.AmbientLight(color, intensity)
light.name = "light";
scene.add(light);
//add helpers
// const axesHelper = new THREE.AxesHelper( 20 );
// scene.add(axesHelper);

//-----hud canvas variables-----//
const hudCanvas = document.querySelector("#hud-canvas");
const hudContext = hudCanvas.getContext("2d");

//-----hud canvas/context configurations-----//
hudCanvas.width = canvas.getBoundingClientRect().width;
hudCanvas.height = canvas.getBoundingClientRect().height;

hudContext.strokeStyle = "green";
hudContext.lineWidth = 2;

//-----load model-----//
const url = "/Parrot.glb";
const gltfLoader = new GLTFLoader();
gltfLoader.load(url,
  function (data) {
    data.scene.children[0].material.side = THREE.DoubleSide;
    scene.add(data.scene)
    console.log("added model to the scene");
  },
  undefined,
  function (error) {
    console.log(error);
  }
);


//-----function declarations-----//

function createLabelElements() {
  let array = [];
  labels.forEach((label) => {  
    let pos = new THREE.Vector3(label.x_coord, label.y_coord, label.z_coord);
    pos.project(camera);
  
    pos.x = (pos.x * widthHalf) + widthHalf;
    pos.y = - (pos.y * heightHalf) + heightHalf;
  
    let element = document.createElement("div");
    element.textContent = label.text;
    element.screenPosition = pos;
    element.classList = "rounded-3";
    element.style.borderColor = label.color;
    element.label = label;
  
    array.push(element);
  });
  return array;
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
      }

    }
  }

}

function addLabelsToPanels() {
  elements.forEach( (element) => {
    if(element.visible) {
      if(element.screenPosition.x < widthHalf ) {
        leftPanel.appendChild(element);
      } else {
        rightPanel.appendChild(element);
      }
    }
  });
}

function drawLabelLines() {
  elements.forEach( (element) => {
    if(element.visible) {
      hudContext.strokeStyle = element.label.color == null ? "white" : element.label.color;

      hudContext.beginPath();
      hudContext.moveTo(element.screenPosition.x, element.screenPosition.y);
      
      if (element.parentElement.id == "right-panel") {
        hudContext.lineTo(element.getBoundingClientRect().left - canvas.getBoundingClientRect().left, //x
                        (element.getBoundingClientRect().top+element.getBoundingClientRect().bottom)/2 - canvas.getBoundingClientRect().top) //y      
      }
      else {
        hudContext.lineTo(element.getBoundingClientRect().right - canvas.getBoundingClientRect().left, //x
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

  //clear the canvas and panels 
  leftPanel.textContent = "";
  rightPanel.textContent = "";
  hudContext.clearRect(0, 0, hudCanvas.width, hudCanvas.height);

  updateScreenPositionForElementsArray();
  sortElementsArray();
  addLabelsToPanels();
  drawLabelLines();

  requestAnimationFrame(update);
}

update();