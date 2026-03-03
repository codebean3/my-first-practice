import router from '@ohos.router';
import { Article } from '../model/components/types';
import { ArticleService } from '../service/ArticleService';

@Entry
@Component
struct ArticleDetails {
  @State article: Article = new Article(0, '', '', '', '', '', '');

  aboutToAppear() {
    // 从路由参数获取文章ID
    const params = router.getParams() as Record<string, Object>;
    if (params && params['articleId']) {
      this.loadArticleDetail(params['articleId'] as number);
    }
  }

  async loadArticleDetail(articleId: number) {
    const articleService = new ArticleService();
    const articleDetail = await articleService.getArticleDetail(articleId);
    if (articleDetail) {
      this.article = articleDetail;
    }
  }

  build() {
    Column({ space: 0 }) {
      // 顶部导航栏
      Row() {
        // 返回按钮 - 使用文本替代图标
        Text('←')
          .fontSize(24)
          .fontColor('#007DFF')
          .onClick(() => {
            router.back();
          })
          .padding({ left: 16 })

        Text('文章详情')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        // 右侧占位，使标题居中
        Text('←')
          .fontSize(24)
          .opacity(0) // 隐藏但占位
          .padding({ right: 16 })
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)

      // 内容区域
      Scroll() {
        Column({ space: 20 }) {
          // 文章标题
          Text(this.article.title)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: 20, right: 20, top: 20 })

          // 文章元信息
          Row() {
            // 作者信息
            Column({ space: 4 }) {
              Text('作者')
                .fontSize(12)
                .fontColor('#666666')
              Text(this.article.author)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
            }
            .layoutWeight(1)

            // 发布时间
            Column({ space: 4 }) {
              Text('发布时间')
                .fontSize(12)
                .fontColor('#666666')
              Text(this.article.publishTime)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
            }
            .layoutWeight(1)

            // 分类
            Column({ space: 4 }) {
              Text('分类')
                .fontSize(12)
                .fontColor('#666666')
              Text(this.article.category)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
            }
            .layoutWeight(1)
          }
          .width('100%')
          .padding({ left: 20, right: 20 })

          // 分割线
          Divider()
            .strokeWidth(1)
            .color('#F0F0F0')
            .margin({ left: 20, right: 20 })

          // 文章内容
          Text(this.article.fullContent || this.article.content)
            .fontSize(16)
            .lineHeight(24)
            .textAlign(TextAlign.Start)
            .width('100%')
            .padding({ left: 20, right: 20, bottom: 30 })
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .layoutWeight(1)
      .backgroundColor('#FAFAFA')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}