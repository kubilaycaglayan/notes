// Only change code below this line
class Thermostat {
  constructor(fahrenheit) {
    this._value = 5/9 * (fahrenheit - 32)
  }

  get temperature() {
    return this._value
  } 

  set temperature(celcius) {
    this._value = celcius
  }
}
// Only change code above this line

const thermos = new Thermostat(76); // Setting in Fahrenheit scale
let temp = thermos.temperature; // 24.44 in Celsius
thermos.temperature = 26;
temp = thermos.temperature; // 26 in Celsius

console.log(temp)