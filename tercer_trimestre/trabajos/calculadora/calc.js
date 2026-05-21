let resultado = document.getElementById("resultado");

function agregarNumero(num) {
  resultado.value += num;
}

function limpiar() {
  resultado.value = "";
}

function borrar() {
  resultado.value = resultado.value.slice(0, -1);
}

function operar(op) {

  const ultimoCaracter = resultado.value.slice(-1);
  if (['+', '-', '*', '/'].includes(ultimoCaracter)) {
    borrar();
  }
  resultado.value += op;
}

function operarEspecial(tipo) {
  let valor = evaluarExpresion(resultado.value);
  
  if (isNaN(valor)) {
    resultado.value = "Error";
    return;
  }

  switch (tipo) {
    case "raiz":
      resultado.value = Math.sqrt(valor);
      break;
    case "x2":
      resultado.value = Math.pow(valor, 2);
      break;
    case "1/x":
      resultado.value = 1 / valor;
      break;
    case "bin":
      
      resultado.value = Math.floor(valor).toString(2);
      break;
    case "hex":

      resultado.value = Math.floor(valor).toString(16).toUpperCase();
      break;
  }
}

function calcular() {
  let res = evaluarExpresion(resultado.value);
  if (!isNaN(res)) {
    
    resultado.value = Math.round(res * 100000000) / 100000000;
  } else {
    resultado.value = "Error";
  }
}

function evaluarExpresion(expresion) {
  if (!expresion) return "";
  try {
    let limpia = expresion.replace(/[^-()\d/*+.]/g, '');
    return new Function('return ' + limpia)();
  } catch (error) {
    return NaN;
  }
}