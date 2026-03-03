export interface  ItemType{
  id?:number;
  title?:string|Resource;
  img?:string|Resource;
  targetPage?:string|Resource;
}
export class Article {
  id: number;
  title: string;
  content: string;
  author: string;
  publishTime: string;
  category: string;
  fullContent:string ;

  constructor(id: number, title: string, content: string, author: string, publishTime: string, category: string,fullContent?:string) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.author = author;
    this.publishTime = publishTime;
    this.category = category;
    this.fullContent=fullContent||content;
  }
}
export interface Data{
  name?:string;
  temperature?:string ;
  temperatureSwitch:boolean;
  LightIntensity?:string;
  Lightswitch:boolean;
  humidity?:string;
  humiditySwitch:boolean;
  waterPump:boolean;
}
