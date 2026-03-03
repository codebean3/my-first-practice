@Component
export default struct MineUser {
  build() {
    Row() {
      // 用户头像
      Image($r('sys.symbol.house_fill')) // 用户头像
        .width(60)
        .height(60)
        .borderRadius(30)
        .backgroundColor('#E6F3FF')

      Column() {
        Text('张三')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1A1A1A')
        Text('123@qq.com')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ top: 4 })
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 16 })
      .layoutWeight(1) // 占据剩余空间
      Image($r('sys.symbol.house_fill')) // 编辑
        .width(20)
        .height(20)
        .margin({ right: 20 })
        .fillColor('#999999')

    }
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .width('92%')
    .height(100)
    .margin({ top: 8, bottom: 16 })
    .borderRadius(16)
    .padding({ left: 20, right: 10 })
    .shadow({ radius: 12, color: '#0D000000', offsetX: 0, offsetY: 2 })
  }
}