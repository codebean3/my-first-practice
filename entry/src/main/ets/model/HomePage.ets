// import {Data} from './components/types'
// import http from '@ohos.net.http';
// @Entry
// @Component
// export struct HomePage {
//   private agricultureData:Array<Data>=[
//     {name:'农田1',
//      temperature:'23摄氏度',
//       temperatureSwitch:true,
//       LightIntensity:'20%',
//       Lightswitch:true,
//       humidity:'21%',
//       humiditySwitch:true,
//       waterPump:false
//     },
//     {name:'农田2',
//       temperature:'35摄氏度',
//       temperatureSwitch:true,
//       LightIntensity:'30%',
//       Lightswitch:true,
//       humidity:'21%',
//       humiditySwitch:true,
//       waterPump:false
//     },
//     {name:'农田3',
//       temperature:'35摄氏度',
//       temperatureSwitch:true,
//       LightIntensity:'25%',
//       Lightswitch:true,
//       humidity:'21%',
//       humiditySwitch:true,
//       waterPump:false
//   }
//   ]
//   build() {
//     Scroll() {
//       List() {
//       ForEach(this.agricultureData, (item: Data) => {
//         ListItem() {
//           Column() {
//             Text(item.name)
//               .alignSelf(ItemAlign.Start)
//               .fontSize(25)
//               .margin({ top: 5 })
//             Row() {
//               Column({ space: 10 }) {
//                 Row() {
//                   Text('温度：' + item.temperature)
//                     .fontSize(20)
//                   Toggle({ type: ToggleType.Switch,isOn:item.temperatureSwitch})
//                     .onChange((isOn:boolean)=>{
//                       item.temperatureSwitch=isOn;
//                     })
//                 }.width('100%')
//                 .justifyContent(FlexAlign.SpaceBetween) //两端对齐
//                 Row() {
//                   Text('湿度：' + item.humidity)
//                     .fontSize(20)
//                   Toggle({ type: ToggleType.Switch,isOn:item.humiditySwitch })
//                     .onChange((isOn:boolean)=>{
//                       item.humiditySwitch=isOn;
//                     })
//                 }.width('100%')
//                 .justifyContent(FlexAlign.SpaceBetween)
//                 Row() {
//                   Text('光照：' + item.LightIntensity)
//                     .fontSize(20)
//                   Toggle({ type: ToggleType.Switch ,isOn:item.Lightswitch})
//                     .onChange((isOn:boolean)=>{
//                       item.Lightswitch=isOn;
//                     })
//                 }.width('100%')
//                 .justifyContent(FlexAlign.SpaceBetween)
//                 Row() {
//                   Text('水泵：' + item.waterPump)
//                     .fontSize(20)
//                   Toggle({ type: ToggleType.Switch ,isOn:item.waterPump})
//                     .onChange((isOn:boolean)=>{
//                       item.waterPump=isOn;
//                     })
//                 }.width('100%')
//                 .justifyContent(FlexAlign.SpaceBetween)
//               }
//             }
//           }
//           .width('97%')
//           .height(200)
//           .borderRadius(15)
//           .padding(15)
//           .margin({ top: 15 })
//           .backgroundColor('#ffa2d999')
//
//         }
//         .width('100%')
//       })
//     }
//     .width("100%")
//       .height("100%")
//   }.scrollBar(BarState.Auto)
//
//  }
// }
import { HuaweiCloudService } from '../service/HuaweiCloudService';

// 定义数据类型
interface Data {
  name: string;
  temperature: string;
  temperatureSwitch: boolean;
  LightIntensity: string;
  LightSwitch: boolean;
  humidity: string;
  humiditySwitch: boolean;
  waterPump: boolean;
}

@Component
export struct HomePage {
  private cloudService: HuaweiCloudService = new HuaweiCloudService();

  @State agricultureData: Array<Data> = [
    {
      name: '农田1',
      temperature: '23°C',
      temperatureSwitch: true,
      LightIntensity: '20%',
      LightSwitch: true,
      humidity: '21%',
      humiditySwitch: true,
      waterPump: false
    },
    {
      name: '农田2',
      temperature: '35°C',
      temperatureSwitch: true,
      LightIntensity: '30%',
      LightSwitch: true,
      humidity: '21%',
      humiditySwitch: true,
      waterPump: false
    },
    {
      name: '农田3',
      temperature: '35°C',
      temperatureSwitch: true,
      LightIntensity: '25%',
      LightSwitch: true,
      humidity: '21%',
      humiditySwitch: true,
      waterPump: false
    }
  ]

  build() {
    Scroll() {
      List() {
        ForEach(this.agricultureData, (item: Data, index?: number) => {
          ListItem() {
            Column() {
              Text(item.name)
                .alignSelf(ItemAlign.Start)
                .fontSize(25)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2C3E50')
                .margin({ top: 5, bottom: 10 })

              Row() {
                Column({ space: 15 }) {
                  // 温度控制
                  Row() {
                    Text('温度：' + item.temperature)
                      .fontSize(18)
                      .fontColor('#34495E')
                    Toggle({ type: ToggleType.Switch, isOn: item.temperatureSwitch })
                      .onChange((isOn: boolean) => {
                        this.updateTemperatureSwitch(index, isOn);
                      })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.SpaceBetween)

                  // 湿度控制
                  Row() {
                    Text('湿度：' + item.humidity)
                      .fontSize(18)
                      .fontColor('#34495E')
                    Toggle({ type: ToggleType.Switch, isOn: item.humiditySwitch })
                      .onChange((isOn: boolean) => {
                        this.updateHumiditySwitch(index, isOn);
                      })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.SpaceBetween)

                  // 光照控制
                  Row() {
                    Text('光照：' + item.LightIntensity)
                      .fontSize(18)
                      .fontColor('#34495E')
                    Toggle({ type: ToggleType.Switch, isOn: item.LightSwitch })
                      .onChange((isOn: boolean) => {
                        this.updateLightSwitch(index, isOn);
                      })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.SpaceBetween)

                  // 水泵控制 - 真实控制
                  Row() {
                    Text('水泵：' + (item.waterPump ? '打开' : '关闭'))
                      .fontSize(18)
                      .fontColor('#34495E')
                    Toggle({ type: ToggleType.Switch, isOn: item.waterPump })
                      .onChange(async (isOn: boolean) => {
                        await this.updateWaterPump(index, isOn);
                      })
                  }
                  .width('100%')
                  .justifyContent(FlexAlign.SpaceBetween)
                }
              }
            }
            .width('95%')
            .height(240)
            .borderRadius(20)
            .padding(20)
            .margin({ top: 12, bottom: 12, left: 10, right: 10 })
            .backgroundColor(this.getCardColor(index))
            .shadow({ radius: 12, color: '#40000000', offsetX: 0, offsetY: 4 })
          }
          .width('100%')
        })
      }
      .width('100%')
      .height('100%')
    }
    .scrollBar(BarState.Auto)
    .backgroundColor(0xFFBFBFBF)
    .width('100%')
    .height('100%')
  }

  // 获取卡片背景颜色（根据索引不同颜色）
  private getCardColor(index?: number): Color {
    const colors: number[] = [
      0xFFE3F2FD, // 淡蓝色
      0xFFE8F5E8, // 淡绿色
      0xFFFFF3E0, // 淡橙色
      0xFFF3E5F5, // 淡紫色
      0xFFE0F2F1, // 淡青色
      0xFFFCE4EC  // 淡粉色
    ];

    if (index !== undefined && index < colors.length) {
      return colors[index];
    }
    return colors[0];
  }

  // 更新温度开关状态
  private updateTemperatureSwitch(index: number | undefined, isOn: boolean): void {
    if (index === undefined) return;

    let newData = [...this.agricultureData];
    newData[index].temperatureSwitch = isOn;
    this.agricultureData = newData;
    console.log('温度开关状态：' + isOn);
  }

  // 更新湿度开关状态
  private updateHumiditySwitch(index: number | undefined, isOn: boolean): void {
    if (index === undefined) return;

    let newData = [...this.agricultureData];
    newData[index].humiditySwitch = isOn;
    this.agricultureData = newData;
    console.log('湿度开关状态：' + isOn);
  }

  // 更新光照开关状态
  private updateLightSwitch(index: number | undefined, isOn: boolean): void {
    if (index === undefined) return;

    let newData = [...this.agricultureData];
    newData[index].LightSwitch = isOn;
    this.agricultureData = newData;
    console.log('光照开关状态：' + isOn);
  }

  // 更新水泵状态
  private async updateWaterPump(index: number | undefined, isOn: boolean): Promise<void> {
    if (index === undefined) return;

    // 先更新本地状态
    let newData = [...this.agricultureData];
    newData[index].waterPump = isOn;
    this.agricultureData = newData;

    try {
      // 调用华为云服务控制水泵
      await this.cloudService.sendControlCommand('waterPump', isOn);
      console.log('水泵控制成功：' + (isOn ? '打开' : '关闭'));
    } catch (error) {
      console.error('水泵控制失败：' + error);
      // 控制失败时恢复原状态
      let revertData = [...this.agricultureData];
      revertData[index].waterPump = !isOn;
      this.agricultureData = revertData;
    }
  }
}