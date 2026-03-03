import SwiperExample from './components/SwiperExample'
import ListExample from './components/ListExample'
 @Entry
@Component
export struct  CommunityPage{
  build() {
    Scroll(){
      Column({space:5}){
        //轮播
        SwiperExample()
        //列表
        ListExample()
      }
      .width('100%')
    }
    .scrollBar(BarState.Auto)
    .backgroundColor('#8D6E63')
  }
}