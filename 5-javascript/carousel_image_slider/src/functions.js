const functions = function functions() {
  const createElement = function createElement(tag, className) {
    const element = document.createElement(tag);
    element.className = className;
    return element;
  };

  const createHiddenElement = function createElement(tag, className) {
    const element = document.createElement(tag);
    element.className = className;
    element.style.display = 'none';
    return element;
  };

  const createElementWithInnerText = function createElementWithInnerText(tag, className, text) {
    const element = document.createElement(tag);
    element.className = className;
    element.innerHTML = text;
    return element;
  };

  const createElementWithInnerTextAndAnchor = function createElementWithInnerText(link, className, text) {
    const element = document.createElement('a');
    element.className = className;
    element.innerHTML = text;
    element.href = link;
    element.target = '_blank';
    return element;
  };

  const createImage = (src, alt, className) => {
    const myImage = new Image();
    myImage.src = src;
    myImage.alt = alt;
    myImage.className = className;
    return myImage;
  };

  return {
    createElement,
    createElementWithInnerText,
    createHiddenElement,
    createElementWithInnerTextAndAnchor,
    createImage,
  };
};

export { functions as default };
