// import { weatherService } from '@kit.WeatherServiceKit';
// import { BusinessError } from '@ohos.base';
//
//
// class WeatherData {
//   temperature: number = 0;
//   humidity: number = 0;
//   condition: string  = '';
// }
// @Component
// export struct WeatherDialog {
//   @State weatherData: WeatherData = new WeatherData();
//   @State cropTips: string = '';
//   @Link showWeatherDialog:boolean;
//
//   aboutToAppear() {
//     this.fetchWeatherData();
//   }
//
//   async fetchWeatherData() {
//     try {
//       let request: weatherService.WeatherRequest = {
//         location: {
//           latitude: 39.9042,
//           longitude: 116.4074
//         }
//       };
//
//       // 调用天气服务
//       let result: weatherService.Weather = await weatherService.getWeather(request);
//
//       // 处理返回结果 - 不使用 any 或 unknown
//       if (result && result.current) {
//         // 直接访问已知的属性，假设这些属性存在
//         this.weatherData.temperature = result.current.temperature ?? 25;
//         this.weatherData.humidity = result.current.humidity ?? 60;
//         this.weatherData.condition= result.current.condition ?.description|| '晴';
//         this.generateCropTips();
//       } else {
//         // 如果没有获取到数据，使用模拟数据
//         this.useMockData();
//       }
//     } catch (error) {
//       console.error('获取天气数据失败:', (error as BusinessError).message);
//       // 使用模拟数据
//       this.useMockData();
//     }
//   }
//
//   // 使用模拟数据
//   useMockData() {
//     this.weatherData.temperature = 25;
//     this.weatherData.humidity = 65;
//     this.weatherData.condition = '晴';
//     this.generateCropTips();
//   }
//
//   // 生成农作物提示
//   generateCropTips() {
//     const temp = this.weatherData.temperature;
//     const humidity = this.weatherData.humidity;
//
//     let tips: string[] = [];
//
//     // 温度提示
//     if (temp < 10) {
//       tips.push('当前温度较低，适合种植耐寒作物如小麦、油菜');
//     } else if (temp >= 10 && temp <= 25) {
//       tips.push('温度适宜，适合大多数农作物生长');
//     } else if (temp > 25 && temp <= 35) {
//       tips.push('温度较高，适合种植水稻、玉米等喜温作物');
//     } else {
//       tips.push('温度过高，需注意作物防晒和灌溉');
//     }
//
//     // 湿度提示
//     if (humidity < 40) {
//       tips.push('湿度较低，需要增加灌溉频率');
//     } else if (humidity >= 40 && humidity <= 70) {
//       tips.push('湿度适宜，有利于作物生长');
//     } else {
//       tips.push('湿度过高，注意通风防病害');
//     }
//
//     // 光照提示
//     tips.push('当前光照充足，有利于光合作用');
//
//     // 二氧化碳提示
//     tips.push('二氧化碳浓度正常，满足作物需求');
//
//     this.cropTips = tips.join('。');
//   }
//
//   build() {
//     Column({ space: 20 }) {
//       Text('今日天气')
//         .fontSize(24)
//         .fontWeight(FontWeight.Bold)
//
//       Column({ space: 12 }) {
//         Text('天气: ' + this.weatherData.condition)
//           .fontSize(18)
//         Text('温度: ' + this.weatherData.temperature + '°C')
//           .fontSize(18)
//         Text('湿度: ' + this.weatherData.humidity + '%')
//           .fontSize(18)
//         Text('光照: 充足')
//           .fontSize(18)
//         Text('二氧化碳: 正常')
//           .fontSize(18)
//       }
//       .width('100%')
//       .alignItems(HorizontalAlign.Start)
//
//       Divider()
//         .color('#CCCCCC')
//         .margin(10)
//
//       Text('农作物生长提示:')
//         .fontSize(16)
//         .fontWeight(FontWeight.Medium)
//         .alignSelf(ItemAlign.Start)
//
//       Text(this.cropTips)
//         .fontSize(17)
//         .textAlign(TextAlign.Start)
//         .padding({ left: 10, right: 10 })
//
//       Button('确定')
//         .width(120)
//         .margin({ top: 20 })
//         .onClick(()=>{
//          this.showWeatherDialog=false
//         })
//     }
//     .opacity(0.7)
//     .padding(20)
//     .width('100%')
//     .backgroundColor('#ff9ee2e5')
//     .borderRadius(16)
//   }
// }
import { BusinessError } from '@ohos.base';

class WeatherData {
  temperature: number = 0;
  humidity: number = 0;
  condition: string = '';
}

@Component
export struct WeatherDialog {
  @State weatherData: WeatherData = new WeatherData();
  @State cropTips: string = '';
  @Link showWeatherDialog: boolean;

  aboutToAppear() {
    this.fetchWeatherData();
  }

  async fetchWeatherData() {
    try {
      // 直接使用模拟数据，不调用天气服务API
      this.useMockData();
    } catch (error) {
      console.error('获取天气数据失败:', (error as BusinessError).message);
      this.useMockData();
    }
  }

  // 使用模拟数据
  useMockData() {
    // 生成随机的模拟天气数据
    const conditions = ['晴', '多云', '阴', '小雨', '阵雨'];
    const randomCondition = conditions[Math.floor(Math.random() * conditions.length)];

    this.weatherData.temperature = 20 + Math.floor(Math.random() * 15); // 20-35°C
    this.weatherData.humidity = 50 + Math.floor(Math.random() * 40); // 50-90%
    this.weatherData.condition = randomCondition;

    this.generateCropTips();
  }

  // 生成农作物提示（保持不变）
  generateCropTips() {
    const temp = this.weatherData.temperature;
    const humidity = this.weatherData.humidity;

    let tips: string[] = [];

    // 温度提示
    if (temp < 10) {
      tips.push('当前温度较低，适合种植耐寒作物如小麦、油菜');
    } else if (temp >= 10 && temp <= 25) {
      tips.push('温度适宜，适合大多数农作物生长');
    } else if (temp > 25 && temp <= 35) {
      tips.push('温度较高，适合种植水稻、玉米等喜温作物');
    } else {
      tips.push('温度过高，需注意作物防晒和灌溉');
    }

    // 湿度提示
    if (humidity < 40) {
      tips.push('湿度较低，需要增加灌溉频率');
    } else if (humidity >= 40 && humidity <= 70) {
      tips.push('湿度适宜，有利于作物生长');
    } else {
      tips.push('湿度过高，注意通风防病害');
    }

    // 根据天气状况添加提示
    if (this.weatherData.condition.includes('雨')) {
      tips.push('有降雨，可适当减少灌溉');
    } else if (this.weatherData.condition === '晴') {
      tips.push('晴天，注意及时灌溉');
    }

    this.cropTips = tips.join('。');
  }

  build() {
    Column({ space: 20 }) {
      Text('今日天气')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        Text('天气: ' + this.weatherData.condition)
          .fontSize(18)
        Text('温度: ' + this.weatherData.temperature + '°C')
          .fontSize(18)
        Text('湿度: ' + this.weatherData.humidity + '%')
          .fontSize(18)
        Text('光照: 充足')
          .fontSize(18)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)

      Divider()
        .color('#CCCCCC')
        .margin(10)

      Text('农作物生长提示:')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text(this.cropTips)
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .padding({ left: 10, right: 10 })

      Button('确定')
        .width(120)
        .margin({ top: 20 })
        .onClick(() => {
          this.showWeatherDialog = false;
        })
    }
    .padding(20)
    .width('80%')
    .backgroundColor('#FF9EE2E5')
    .borderRadius(16)
    .shadow({ radius: 10, color: '#40000000', offsetX: 0, offsetY: 2 })
  }
}