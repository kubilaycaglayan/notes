import functions from './functions';
import './style.sass';
import FirstImage from './images/first.jpg';
import SecondImage from './images/second.jpg';
import ThirdImage from './images/third.jpg';
import Fourth from './images/fourth.jpg';
import Fifth from './images/fifth.jpg';
import Sixth from './images/sixth.jpg';

const slider = (function slider() {
  const container = document.getElementById('imageSlider');
  const slides = functions().createElement('div', 'slides text-center');
  let activeImageId = 0;
  const images = document.getElementsByClassName('cimg');

  const show = function show(id) {
    images[id].className = 'cimg rounded';
    images[id].style.visibility = 'visible';
  };

  const hide = function hide(id) {
    images[id].className = 'cimg d-none';
    images[id].style.visibility = 'hidden';
  };

  const showOneHideOthers = function showOneHideOthers(id) {
    if (id !== activeImageId) {
      show(id);
      hide(activeImageId);
      activateNavDot(id);
      deActivateNavDot(activeImageId);
      activeImageId = id;
    }
  };

  const next = function next() {
    if (activeImageId + 2 > count()) {
      return;
    }
    showOneHideOthers(activeImageId + 1);
  };

  const nextInfinite = function nextInfinite() {
    if (activeImageId + 2 > count()) {
      showOneHideOthers(0);
      return;
    }
    showOneHideOthers(activeImageId + 1);
  };

  const previous = function previous() {
    if (activeImageId - 1 < 0) {
      return;
    }
    showOneHideOthers(activeImageId - 1);
  };

  const previousButton = functions().createElement('i', 'fas fa-chevron-left arrows');
  container.appendChild(previousButton);

  previousButton.addEventListener('click', previous.bind(this));

  const nextButton = functions().createElement('i', 'fas fa-chevron-right arrows');
  container.appendChild(nextButton);

  nextButton.addEventListener('click', next.bind(this));

  const activateNavDot = function activateNavDot(id) {
    const navDot = document.getElementsByClassName('navDots')[id];
    navDot.className = 'fas fa-circle navDots';
  };

  const deActivateNavDot = function deActivateNavDot(id) {
    const navDot = document.getElementsByClassName('navDots')[id];
    navDot.className = 'far fa-circle navDots';
  };

  const addNavDot = function addNavDot(id) {
    const navDot = functions().createElement('i', 'far fa-circle navDots');
    container.appendChild(navDot);
    navDot.addEventListener('click', showOneHideOthers.bind(this, id));
  };

  const imageSlider = document.getElementById('imageSlider');
  imageSlider.appendChild(slides);
  const initialImage = functions().createImage(FirstImage, 'nature', 'cimg rounded');
  slides.appendChild(initialImage);
  let imageCount = 1;
  addNavDot(0);
  activateNavDot(0);

  const add = function add(source) {
    const image = functions().createImage(source, `image ${imageCount}`, 'cimg rounded d-none');
    slides.appendChild(image);
    addNavDot(imageCount);
    imageCount += 1;
  };

  const count = function getImageCount() {
    return imageCount;
  };

  return {
    add,
    nextInfinite,
    count,
  };
}());

slider.add(SecondImage);
slider.add(ThirdImage);
slider.add(Fourth);
slider.add(Fifth);
slider.add(Sixth);



setInterval(() => {
  slider.nextInfinite();
}, 5000);
