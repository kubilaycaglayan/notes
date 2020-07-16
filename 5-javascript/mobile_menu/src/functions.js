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

  return {
    createElement,
    createElementWithInnerText,
    createHiddenElement,
    createElementWithInnerTextAndAnchor,
  };
};

export { functions as default };
