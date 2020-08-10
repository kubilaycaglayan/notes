const count = () => {
  let num = 0;

  return () => {
    console.log(num);
    num += 1;
  };
};

const counter = count();

counter();
counter();
counter();
counter();