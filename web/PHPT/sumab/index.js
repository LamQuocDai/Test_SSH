function Sum() {
  var a = document.getElementById("so-a").value;
  var b = document.getElementById("so-b").value;
  var pt = document.getElementById("phep-tinh").value;

  a1 = parseInt(a);
  b1 = parseInt(b);

  switch (pt) {
    case "1":
      console.log(a1+b1);
      document.getElementById("ket-qua").value = a1 + b1;
      break;
    case "2":
      document.getElementById("ket-qua").value = a1 - b1;
      break;
    case "3":
      document.getElementById("ket-qua").value = a1 * b1;
      break;
    case "4":
      document.getElementById("ket-qua").value = a1 / b1;
      break;
  }
}
