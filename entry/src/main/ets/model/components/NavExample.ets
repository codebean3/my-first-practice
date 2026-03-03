// import router from '@ohos.router'
import  {ItemType} from  '../components/types'
@Component
export default struct NavExample{
  private  navData:Array<ItemType>=[
    {
      title:'我的',
      img:$r('app.media.agriculture1'),//png
      targetPage:'Page/LineGraph'
    },
    {
      title:'我的',
      img:$r('app.media.woman'),
      targetPage:'Page/Graph'
    },
    {
      title:'我的',
      img:$r('app.media.farmer'),
      targetPage:'Page/Graph'
    }
  ]
  build() {
    Column() {
      Grid(){
        ForEach(this.navData,(item:ItemType)=>{
          GridItem(){
            Column(){
              Image(item.img)
                .width(50)
                .height(50)

              Text(item.title)
                .fontSize(20)
              }
              .width(70)
              .height(70)
            }
            .backgroundColor('#BBDEFB')
            .width('95%')
            .height('50%')

        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .rowsGap(12)
      .columnsGap(8)
    }
  }
}
