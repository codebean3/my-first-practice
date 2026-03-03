// import  {Article,ItemType} from '../components/types'
// import { ArticleService } from '../../service/ArticleService';
// @Component
// export default struct ListExample {
//   private articleService: ArticleService = new ArticleService();
//   @State articlesData: Article[] = [];
//   @State isLoading: boolean = true;
//
//   aboutToAppear() {
//     this.loadArticles();
//   }
//
//   async loadArticles() {
//     this.isLoading = true;
//     this.articlesData = await this.articleService.getAgricultureArticles();
//     this.isLoading = false;
//   }
//
//   build() {
//     Column() {
//       Text('农业知识文章')
//         .fontSize(24)
//         .fontWeight(FontWeight.Bold)
//         .margin({ top: 20, bottom: 10 })
//         .width('100%')
//         .textAlign(TextAlign.Center)
//
//       if (this.isLoading) {
//         Column() {
//           // 修复 Progress 组件参数
//           Progress({ value: 0, total: 100 })
//             .width(50)
//             .height(50)
//           Text('加载中...')
//             .margin({ top: 10 })
//         }
//         .width('100%')
//         .height(200)
//         .justifyContent(FlexAlign.Center)
//       } else {
//         // 修复 List 组件，明确设置宽高
//         Refresh({refreshing:false}){
//           List({ space: 12 }) {
//             ForEach(this.articlesData, (article: Article) => {
//               ListItem() {
//                 // 创建列表项构建器
//                 this.buildArticleItem(article)
//               }
//             })
//           }
//           .width('100%')
//           .height('100%')
//           .layoutWeight(1)
//         }
//         .onStateChange(()=>{
//           //拉取数据，使用状态变量
//         })
//       }
//     }
//     .width('100%')
//     .height('100%')
//     .padding(16)
//     .backgroundColor('#ff8bb18e')
//   }
//
//   @Builder
//   buildArticleItem(article: Article) {
//     // 创建明确的列表项对象
//     Row({ space: 12 }) {
//       Image(this.getImageByCategory(article.category))
//         .width(80)
//         .height(80)
//         .objectFit(ImageFit.Cover)
//         .borderRadius(8)
//
//       Column({ space: 6 }) {
//         Text(article.title)
//           .fontSize(18)
//           .fontWeight(FontWeight.Bold)
//           .textAlign(TextAlign.Start)
//           .maxLines(1)
//           .textOverflow({ overflow: TextOverflow.Ellipsis })
//           .width('100%')
//
//         Text(article.content)
//           .fontSize(14)
//           .textAlign(TextAlign.Start)
//           .maxLines(2)
//           .textOverflow({ overflow: TextOverflow.Ellipsis })
//           .width('100%')
//
//         Row() {
//           Text(article.author)
//             .fontSize(12)
//             .fontColor('#666666')
//
//           Text(article.publishTime)
//             .fontSize(12)
//             .fontColor('#666666')
//             .margin({ left: 10 })
//         }
//         .width('100%')
//         .justifyContent(FlexAlign.Start)
//       }
//       .layoutWeight(1)
//     }
//     .width('100%')
//     .padding(16)
//     .backgroundColor(Color.White)
//     .borderRadius(12)
//   }
//
//   private getImageByCategory(category: string): Resource {
//     switch(category) {
//       case '种植技术':
//         return $r('app.media.farmer');
//       case '农业科技':
//         return $r('app.media.woman');
//       case '有机农业':
//         return $r('app.media.agriculture1');
//       default:
//         return $r('app.media.farmer');
//     }
//   }
// }
import { Article } from '../components/types'
import { ArticleService } from '../../service/ArticleService';
import router from '@ohos.router';

@Component
export default struct ListExample {
  private articleService: ArticleService = new ArticleService();
  @State articlesData: Article[] = [];
  @State isLoading: boolean = true;

  aboutToAppear() {
    this.loadArticles();
  }

  async loadArticles() {
    this.isLoading = true;
    this.articlesData = await this.articleService.getAgricultureArticles();
    this.isLoading = false;
  }

  build() {
    Column() {
      Text('农业知识文章')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })
        .width('100%')
        .textAlign(TextAlign.Center)

      if (this.isLoading) {
        Column() {
          Progress({ value: 0, total: 100 })
            .width(50)
            .height(50)
          Text('加载中...')
            .margin({ top: 10 })
        }
        .width('100%')
        .height(200)
        .justifyContent(FlexAlign.Center)
      } else {
        Refresh({ refreshing: false }) {
          List({ space: 12 }) {
            ForEach(this.articlesData, (article: Article) => {
              ListItem() {
                this.buildArticleItem(article)
              }
            })
          }
          .width('100%')
          .height('100%')
          .layoutWeight(1)
        }
        .onStateChange((refreshStatus: RefreshStatus) => {
          // 拉取数据，使用状态变量
          console.info('刷新状态: ' + refreshStatus);
        })
      }
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#ff8bb18e')
  }
  @Builder
  buildArticleItem(article: Article) {
    Row({ space: 12 }) {
      // 最简单的图片点击
      Column() {
        Image(this.getImageByCategory(article.category))
          .width(80)
          .height(80)
          .objectFit(ImageFit.Cover)
          .borderRadius(8)
      }
      .width(80)
      .height(80)
      .onClick(() => {
        console.info('最简单的图片点击 - 文章ID: ' + article.id);

        // 使用最简单的跳转，不带参数
        router.pushUrl({
          url: 'pages/TestPage'
        });
      })

      Column({ space: 6 }) {
        Text(article.title)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')

        Text(article.content)
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')

        Row() {
          Text(article.author)
            .fontSize(12)
            .fontColor('#666666')

          Text(article.publishTime)
            .fontSize(12)
            .fontColor('#666666')
            .margin({ left: 10 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  private getImageByCategory(category: string): Resource {
    switch (category) {
      case '种植技术':
        return $r('app.media.farmer');
      case '农业科技':
        return $r('app.media.woman');
      case '有机农业':
        return $r('app.media.agriculture1');
      default:
        return $r('app.media.farmer');
    }
  }
}