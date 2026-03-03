import { ItemType } from '../components/types'
@Component
export default struct MineList {
  private ListData: Array<ItemType> = [
    {
      title: '消息通知',
      img: $r('app.media.img_2') // 消息
    },
    {
      title: '系统设置',
      img: $r('app.media.img_6') //：设置
    },
    {
      title: '浏览历史',
      img: $r('app.media.img_5') //历史记录
    },
    {
      title: '主题模式',
      img: $r('app.media.img_4') //深色模式
    },
    {
      title: '清理缓存',
      img: $r('app.media.img_3') // 清理
    },
    {
      title: '关于我们',
      img: $r('app.media.img_7') //关于
    }
  ]

  @State toggleStates: boolean[] = [true, false, true, false, false]

  build() {
    List() {
      ForEach(this.ListData, (item: ItemType, index?: number) => {
        ListItem() {
          Row({ space: 16 }) {
            // 图标和文字
            Row({ space: 12 }) {
              Image(item.img)
                .width(24)
                .height(24)
                .fillColor('#1A73E8')
              Text(item.title)
                .fontSize(17)
                .fontColor('#1A1A1A')
                .fontWeight(FontWeight.Medium)
            }
            .layoutWeight(1)

            // 右侧内容
            if (index !== undefined && index < 5) {
              Toggle({
                type: ToggleType.Switch,
                isOn: this.toggleStates[index]
              })
                .onChange((isOn: boolean) => {
                  if (index !== undefined) {
                    this.toggleStates[index] = isOn;
                  }
                })
                .switchPointColor('#1A73E8')
            } else {
              Image($r('sys.symbol.arrow_right')) //：右箭头
                .width(16)
                .height(16)
                .fillColor('#999999')
            }
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 20, right: 20, top: 16, bottom: 16 })
        }
        .backgroundColor(Color.White)
        .borderRadius(0)
      })
    }
    .width('92%')
    .backgroundColor(Color.White)
    .borderRadius(16)
    .margin({ top: 8, bottom: 8 })
    .shadow({ radius: 12, color: '#0D000000', offsetX: 0, offsetY: 2 })
    .divider({
      color: '#F0F0F0',
      strokeWidth: 1,
      startMargin: 60,
      endMargin: 20
    })
  }
}
