(new Promise((resolve, reject) => {
  reject("Nope");
}))
  .then(() => {
    console.log("success");
  })
  .catch((e) => {
    console.log("fail", e);
  })
  .finally(res => {
    console.log("finally");
  });
