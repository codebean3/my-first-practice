import {Prompt ,router} from '@kit.ArkUI';
import {UserBean} from '../model/UserBean';
@Entry
@Component
struct Index {
  @State username: string = "";
  @State password: string = "";
  @State isSelect: boolean = false
  @State isPasswordVisible: boolean = false
  private  otherData:Array<string>=[
    "微信" ,"QQ", "手机"
  ]
  loginMsg(){
    if(this.username!=""&&this.password!=""){
      Prompt.showToast({message:"登陆成功"})
      let user:UserBean=new UserBean("admin","安琪”,“123456","anqi@163.com","13424563456");
      if(user!=null && user.username!=""){
        AppStorage.setOrCreate("user",user);
        //获取华为云token信息存入appstorage
        router.pushUrl({
          url:"pages/MainPage"
        })
      }else{
        Prompt.showToast({message:"用户名或密码错误",duration:2000})
      }
    }else{
      Prompt.showToast({message:"用户名或密码不能为空",duration:2000})
    }
  }
  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      // 背景图片
      Image($r('app.media.bg1'))
        .objectFit(ImageFit.Cover)
        .width('100%')
        .height('200%')

      // 半透明遮罩
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('#00000030')

      // 登录表单
      Column() {
        // Logo和标题
        Column() {
          Image($r('app.media.logo'))
            .width(180)
            .height(100)
            .margin({top: -20 ,bottom: -50})
          Text('MobileAgriculture')
            .fontSize(30)
            .fontColor("#FFFFFF")
            .fontWeight(FontWeight.Bold)
            .margin({top:60, bottom :-65})
          SymbolGlyph($r('app.media.img_1'))
            .fontSize(60)
            .fontColor([$r('app.color.white')])
            .margin({ bottom: 18 })

          Text('欢迎登录')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
            .margin({ bottom: 10 })

          Text('请输入您的账户信息')
            .fontSize(14)
            .fontColor('#E2E8F0')
        }
        .alignItems(HorizontalAlign.Center)
        .margin({ top: 100, bottom: 10 })

        // 登录表单
        Column() {
          // 用户名输入
          TextInput({ placeholder: '用户名', text: this.username })
            .width('100%')
            .height(50)
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .padding({ left: 16, right: 16 })
            .placeholderColor('#94A3B8')
            .caretColor('#3B82F6')
            .onChange((value: string) => {
              this.username = value;
            })
            .margin({ bottom: 16 })

          // 密码输入
          Row() {
            TextInput({
              placeholder: '密码',
              text: this.password
            })
              .width('110%')
              .height(50)
              .type(this.isPasswordVisible ? InputType.Normal : InputType.Password)
              .placeholderColor('#94A3B8')
              .caretColor('#3B82F6')
              .onChange((value: string) => {
                this.password = value;
              })

            // 显示/隐藏密码
            SymbolGlyph(this.isPasswordVisible ? $r('app.media.img_1') : $r('app.media.img'))
              .fontSize(20)
              .fontColor([$r('app.color.blue')])
              .onClick(() => {
                this.isPasswordVisible = !this.isPasswordVisible;
              })
          }
          .width('100%')
          .height(50)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 24 })

          // 登录按钮
          Button('登录', { type: ButtonType.Capsule })
            .width('100%')
            .height(50)
            .backgroundColor('#3B82F6')
            .fontColor(Color.White)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .onClick(() => {
              if(!this.isSelect){
                AlertDialog.show({
                  title:'提示',
                  message:'请勾选隐私协议',
                  autoCancel:true
                })
                return
              }
              this.loginMsg();
            })
            .stateEffect(true)
            .margin({ bottom: 30 })
          Row(){
            Row(){
              Checkbox()
                .width(15)
                .height(20)
                .select(this.isSelect)
                .onChange((value:boolean)=>{
                  this.isSelect=value
                })
              Text('已阅读并同意用户协议与隐私策略')
                .fontColor(Color.White)
            }
          }
          .width('130%')
          .margin({top:-25})
          // 微信登录
          Row() {
            Divider()
              .width('20%')
              .color('#FFFFFF')

            Text('用其他方式登录')
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ left:10, right: 10 })

            Divider()
              .width('20%')
              .color('#FFFFFF')
          }
          .width('100%')
          .margin({ bottom: 20 })
          Row({space:20}){
            ForEach(this.otherData,(item:string)=>{
              Button(item,{type:ButtonType.Circle,stateEffect:true})
                .width(60)
                .height(60)
            },(item:string)=>JSON.stringify((item)))
          }

        }
        .width('80%')
        .padding(24)
        .backgroundColor('green1')
        .backdropBlur(10)
        .borderRadius(10)
        .alignItems(HorizontalAlign.Center)
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
  }
}