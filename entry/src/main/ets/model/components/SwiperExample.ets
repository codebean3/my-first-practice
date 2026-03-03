@Component
export default struct SwiperExample{
  @State swiperData:Array<Resource>=[
    $r('app.media.farmer'),
    $r('app.media.woman'),
    $r('app.media.agriculture1')
  ]
  build() {
    Column(){
      Swiper() {
        ForEach(this.swiperData,(item:Resource)=>{
          Image(item)
            .width('95%')
            .height(160)
        })
      }
      .index(0)
      .autoPlay(true)
      .interval(2500)
    }
    .width('100%')
    .margin({top:5})
  }
}

