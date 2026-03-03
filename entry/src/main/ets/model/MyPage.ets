import router from '@ohos.router';
import MineUser from './components/MineUser';
import MineList from './components/MineList';
@Component
export struct MyPage {
  @State message: string = '个人中心'

  build() {
    Scroll() {
      Column() {
        // 页面标题
        Text(this.message)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
          .alignSelf(ItemAlign.Start)
          .margin({ left: 16, top: 20, bottom: 10 })

        // 用户信息卡片
        MineUser()

        // 设置列表
        MineList()

        // 退出登录按钮
        Button("退出登录")
          .width('92%')
          .height(48)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#FFFFFF')
          .fontColor('#FF3B30')
          .border({
            width: 1,
            color: '#FF3B30',
            radius: 24
          })
          .margin({ top: 40, bottom: 30 })
          .shadow({ radius: 8, color: '#10000000', offsetX: 0, offsetY: 2 })
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Index'
            }).catch((error: Error) => {
              console.error('页面跳转失败: ' + error.message);
            })
          })

      }
      .width('100%')
      .height('100%')
    }
    .scrollBar(BarState.Auto)
    .backgroundColor('#F8F9FA')
  }
}