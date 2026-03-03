export class  MobileAgriculture{
  illumination?:string=""
  temperature?:string=""
  humidity?:string=""
  pump?:string=""
  constructor(illumination?:string,temperature?:string,humidity?:string,pump?:string) {
    this.illumination = illumination
    this.temperature = temperature
    this.humidity = humidity
    this.pump = pump
  }
}