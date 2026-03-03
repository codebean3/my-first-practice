import {MyPage} from '../model/MyPage';
import {HomePage} from '../model/HomePage';
import {CommunityPage} from '../model/CommunityPage';
import {RecordPage} from './RecordPage';
import {WeatherDialog} from '../model/components/WeatherDialog'
@Entry
@Component
struct MainPage {
  @State currentIndex:number=0
  @State showWeatherDialog:boolean=true;
  tabController: TabsController= new TabsController()
  @Builder TabBuilder(title:string, index:number, image:Resource){
    Column({space:4}){
      SymbolGlyph(image).fontSize(30)
        .fontColor(this.currentIndex==index?["#FF6EE0A4"]:[Color.Black])
      Text(title)
        .fontColor(this.currentIndex==index?"#FF6EE0A4":Color.Black)
    }
    .onClick(()=>{
      this.currentIndex=index
      this.tabController.changeIndex(index)
    })
  }
  build() {
    Stack() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {//页签
        TabContent() {
          HomePage()
        }.backgroundColor("#f1f3f5")
        .tabBar(this.TabBuilder("首页", 0, $r('sys.symbol.house_fill')))

        TabContent() {
          RecordPage()
        }.backgroundColor('#f1f3f5')
        .tabBar(this.TabBuilder("记录", 1, $r('sys.symbol.list_square_bill')))

        TabContent() {
          CommunityPage()
        }.backgroundColor("#f1f3f5")
        .tabBar(this.TabBuilder("社区", 2, $r('sys.symbol.worldclock_fill_2')))

        TabContent() {
          MyPage()
        }.backgroundColor("#f1f3f5")
        .tabBar(this.TabBuilder("我的", 3, $r('sys.symbol.person')))
      }
      .onChange((index) => {
        this.currentIndex = index
      })

      if (this.showWeatherDialog) {
        Stack({ alignContent: Alignment.Center }) {
          // 遮罩层...
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('#666666')
            .onClick(() => {
              this.showWeatherDialog = false;
            })
          WeatherDialog({ showWeatherDialog: $showWeatherDialog })
        }
      }
    }
  }
}
