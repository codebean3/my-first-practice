import {router} from '@kit.ArkUI';
import { url } from '@kit.ArkTS';
@Entry
@Component
export struct  RecordPage{
  build() {
    Column({space:20}){
      Button('湿度折线图')
        .fontSize(18)
        .backgroundColor('#ffa2d999')
        .width('90%')
        .height(100)
        .borderRadius(8)
        .onClick(()=> {
          router.pushUrl({
            url: 'pages/CanvasChartPage',
            params: {
              chartType: 'humidity'
            }
          });
        })
      Button('灌溉量折线图')
        .fontSize(18)
        .backgroundColor('#ff7eafd0')
        .width('80%')
        .height(100)
        .borderRadius(8)
        .onClick(()=> {
          router.pushUrl({
            url: 'pages/CanvasChartPage',
            params: {
              chartType: 'irrigation'
            }
          });
        })
      Button('温度折线图')
        .fontSize(18)
        .backgroundColor('#ffa2d999')
        .width('90%')
        .height(100)
        .borderRadius(8)
        .onClick(()=> {
          router.pushUrl({
            url: 'pages/CanvasChartPage',
            params: {
              chartType: 'temperature'
            }
          });
        })
      Button('光照折线图')
        .fontSize(18)
        .backgroundColor('#ff7eafd0')
        .width('80%')
        .height(100)
        .borderRadius(8)
        .onClick(()=> {
          router.pushUrl({
            url: 'pages/CanvasChartPage',
            params: {
              chartType: 'light'
            }
          });
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}