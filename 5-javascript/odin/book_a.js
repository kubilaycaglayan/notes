function Book(title, author, pages, read = false) {
  this.title = title;
  this.author = author;
  this.pages = pages;
  this.read = read;
  this.info = function() {
    const readStatus = this.read ? 'has been read' : 'not read yet';
    const msg = `${this.title} by ${this.author}, ${this.pages} pages, ${readStatus}.`;
    return msg;
  };
}

let call_of_the_wild = new Book('Call of The Wild', 'Jack London', '75');

console.log(call_of_the_wild.info());