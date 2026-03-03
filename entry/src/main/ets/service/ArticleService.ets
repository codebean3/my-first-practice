import { httpUtil } from '../../../ohosTest/ets/HttpUtil';
import { Article } from '../model/components/types';

export class ArticleService {
  async getAgricultureArticles(): Promise<Article[]> {
    const mockData: Article[] = [
      new Article(
        1,
        '现代农业种植技术指南',
        '详细介绍了现代化农业种植的最新技术和方法...',
        '农业科学院',
        '2024-03-15',
        '种植技术',
        `# 现代农业种植技术指南

## 概述
现代农业种植技术正在经历革命性的变革，智能化和精准化成为主要趋势。本文详细介绍了现代化农业种植的最新技术和方法，帮助农民提高作物产量和品质。

## 主要内容

### 1. 智能灌溉系统
- 基于土壤湿度传感器的精准灌溉
- 滴灌、喷灌技术的优化应用
- 水资源利用率提升方案

### 2. 精准施肥技术
- 土壤养分检测与分析
- 变量施肥技术应用
- 有机肥与化肥的科学配比

### 3. 种植管理
- 作物生长周期监控
- 病虫害预警与防治
- 收获时机判断标准

## 总结
通过采用现代化种植技术，农业生产效率可提升30%以上，同时减少资源浪费和环境污染。

**作者：** 农业科学院
**发布时间：** 2024年3月15日
**分类：** 种植技术`
      ),
      new Article(
      2,
      '智能灌溉系统在农业中的应用',
      '深入分析智能化灌溉系统如何通过传感器和数据分析提高水资源利用率...',
      '农业工程研究所',
      '2024-03-12',
      '农业科技',
      `# 智能灌溉系统在农业中的应用

## 技术原理
智能灌溉系统通过部署在田间的各类传感器，实时监测土壤湿度、温度、光照强度等参数，结合气象数据和作物生长模型，实现精准灌溉。

## 系统组成

### 1. 传感器网络
- 土壤湿度传感器
- 气象监测站
- 作物生长监测摄像头

### 2. 控制中心
- 数据分析算法
- 灌溉决策系统
- 远程控制平台

### 3. 执行设备
- 智能阀门
- 滴灌管道
- 喷灌设备

## 效益分析
- 节水30-50%
- 提高作物产量15-25%
- 减少人工成本60%

**作者：** 农业工程研究所
**发布时间：** 2024年3月12日
**分类：** 农业科技`
    ),     new Article(
      3,
      '有机农业的发展前景分析',
      '全面探讨有机农业在当前环境下的发展机遇和挑战...',
      '绿色农业协会',
      '2024-03-10',
      '有机农业',
      `# 有机农业的发展前景分析

## 市场现状
随着消费者健康意识的提升，有机农产品市场需求持续增长。2023年全球有机食品市场规模达到2000亿美元，年增长率保持在10%以上。

## 发展机遇

### 1. 政策支持
- 国家有机农业补贴政策
- 绿色农业发展基金
- 有机认证便利化

### 2. 消费升级
- 健康意识增强
- 高品质农产品需求增长
- 绿色消费理念普及

## 面临的挑战
- 生产技术要求高
- 初期投入成本大
- 市场认知度有待提升

## 发展建议
1. 加强技术培训
2. 建立品牌形象
3. 拓展销售渠道

**作者：** 绿色农业协会
**发布时间：** 2024年3月10日
**分类：** 有机农业`
    ),
      new Article(
        4,
        '水稻高产栽培技术要点',
        '系统介绍水稻高产栽培的关键技术，包括品种选择、育苗管理...',
        '国家水稻研究所',
        '2024-03-08',
        '粮食作物',
        `# 水稻高产栽培技术要点

## 品种选择
根据当地气候条件和土壤特性，选择适宜的高产优质水稻品种。

## 栽培技术

### 1. 育苗管理
- 种子处理与消毒
- 苗床准备与管理
- 秧苗期病虫害防治

### 2. 田间管理
- 合理密植
- 科学施肥
- 水分管理

### 3. 病虫害防治
- 预防为主的原则
- 生物防治技术
- 化学防治注意事项

## 收获与储存
- 最佳收获时机判断
- 干燥与储存条件
- 品质保持技术

**作者：** 国家水稻研究所
**发布时间：** 2024年3月8日
**分类：** 粮食作物`
      ),
      new Article(5, '温室大棚蔬菜种植管理', '详细讲解温室大棚环境下蔬菜种植的温度、湿度、光照控制技术，以及水肥一体化管理的具体操作方法。', '设施农业研究中心', '2024-03-05', '蔬菜种植'),
      new Article(6, '果树病虫害综合防治方案', '提供果树常见病虫害的识别方法和综合防治策略，强调生物防治和生态平衡的重要性，减少化学农药使用。', '果树保护研究所', '2024-03-03', '果树栽培'),
      new Article(7, '土壤改良与地力提升技术', '介绍不同土壤类型的改良方法，包括有机质提升、酸碱度调节、微生物菌剂使用等，帮助改善土壤健康状况。', '土壤肥料研究所', '2024-02-28', '土壤管理'),
      new Article(8, '农业无人机在精准农业中的应用', '分析农业无人机在作物监测、病虫害识别、精准施药等方面的应用前景和技术要点，展示数字农业的最新进展。', '智慧农业实验室', '2024-02-25', '农业科技'),
      new Article(9, '畜禽养殖废弃物资源化利用', '探讨畜禽养殖废弃物的处理和资源化利用技术，包括沼气发电、有机肥生产等，实现养殖业可持续发展。', '畜牧环境工程所', '2024-02-22', '畜牧养殖'),
      new Article(10, '农产品电商营销策略分析', '针对农产品电商的特点，分析有效的线上营销策略、品牌建设和物流解决方案，帮助农户拓展销售渠道。', '农业经济研究所', '2024-02-20', '农业经济'),
      new Article(11, '气候变化对农业生产的影响', '研究气候变化对农作物生长周期、病虫害发生规律的影响，提出适应性种植策略和风险管理措施。', '农业气象中心', '2024-02-18', '农业环境'),
      new Article(12, '特色农产品品牌建设指南', '指导如何打造具有地域特色的农产品品牌，包括品质标准制定、包装设计、文化内涵挖掘等方面的具体方法。', '品牌农业促进会', '2024-02-15', '品牌农业'),
      new Article(13, '水肥一体化技术实践手册', '详细介绍水肥一体化系统的设计、安装和运维，包括设备选型、肥料配比、灌溉计划制定等实操内容。', '节水农业研究所', '2024-02-12', '节水灌溉'),
      new Article(14, '农业合作社经营管理要点', '解析农业合作社的组建流程、管理制度和利益分配机制，分享成功合作社的经验案例和管理智慧。', '农村合作经济学会', '2024-02-10', '农业组织'),
      new Article(15, '农产品质量安全追溯系统', '介绍农产品质量安全追溯系统的建设方法和运营模式，确保从田间到餐桌的全程可追溯，提升消费者信任。', '质量安全检测中心', '2024-02-08', '质量安全'),
      new Article(16, '乡村休闲旅游发展模式探索', '分析乡村休闲旅游的不同发展模式，包括农家乐、民宿、农事体验等，探讨农旅融合的创新路径。', '乡村旅游研究院', '2024-02-05', '休闲农业'),
      new Article(17, '新型农业经营主体培育政策', '解读国家培育家庭农场、农民合作社等新型农业经营主体的相关政策，分析政策红利和申报要点。', '农业农村局', '2024-02-03', '农业政策'),
      new Article(18, '农业保险与风险防范机制', '介绍各类农业保险产品的特点和适用场景，帮助农户建立完善的风险防范体系，减少自然灾害损失。', '农业风险管理所', '2024-02-01', '农业金融'),
      new Article(19, '生态循环农业技术模式', '展示生态循环农业的成功案例和技术模式，包括种养结合、物质循环利用等，实现农业废弃物资源化。', '生态农业研究所', '2024-01-28', '生态农业'),
      new Article(20, '智慧农业物联网解决方案', '全面介绍智慧农业物联网系统的架构和应用，包括环境监测、设备控制、数据分析等功能模块。', '数字农业创新中心', '2024-01-25', '智慧农业')
    ];

    return mockData;
  }

  async searchArticles(keyword: string): Promise<Article[]> {
    const allArticles = await this.getAgricultureArticles();
    if (!keyword.trim()) {
      return allArticles;
    }

    // 改进搜索逻辑，支持更灵活的匹配
    const lowerKeyword = keyword.toLowerCase();
    return allArticles.filter(article =>
    article.title.toLowerCase().includes(lowerKeyword) ||
    article.content.toLowerCase().includes(lowerKeyword) ||
    article.category.toLowerCase().includes(lowerKeyword) ||
    article.author.toLowerCase().includes(lowerKeyword)
    );
  }

  // 新增：按分类获取文章
  async getArticlesByCategory(category: string): Promise<Article[]> {
    const allArticles = await this.getAgricultureArticles();
    if (!category.trim()) {
      return allArticles;
    }

    return allArticles.filter(article =>
    article.category.toLowerCase().includes(category.toLowerCase())
    );
  }
  async getArticleDetail(articleId: number): Promise<Article | null> {
    console.info('获取文章详情，ID: ' + articleId);
    const allArticles = await this.getAgricultureArticles();
    const article = allArticles.find((item: Article) => item.id === articleId);
    console.info('找到文章: ' + (article ? article.title : 'null'));
    return article || null;
  }

  // 新增：获取所有分类（修复了扩展运算符问题）
  async getArticleCategories(): Promise<string[]> {
    const allArticles = await this.getAgricultureArticles();

    // 使用传统方法替代扩展运算符
    const categorySet = new Set<string>();
    for (const article of allArticles) {
      categorySet.add(article.category);
    }

    // 将Set转换为数组
    const categories: string[] = [];
    categorySet.forEach(category => categories.push(category));

    return categories.sort();
  }

  // 新增：获取热门文章（按发布日期排序）
  async getPopularArticles(limit: number = 5): Promise<Article[]> {
    const allArticles = await this.getAgricultureArticles();

    // 按日期降序排序并返回前limit个
    return allArticles
      .sort((a, b) => new Date(b.publishTime).getTime() - new Date(a.publishTime).getTime())
      .slice(0, limit);
  }

  // 新增：获取相关文章（基于分类）
  async getRelatedArticles(articleId: number, limit: number = 3): Promise<Article[]> {
    const allArticles = await this.getAgricultureArticles();
    const targetArticle = allArticles.find(article => article.id === articleId);

    if (!targetArticle) {
      return [];
    }

    // 返回同一分类的其他文章（排除自己）
    return allArticles
      .filter(article =>
      article.id !== articleId &&
        article.category === targetArticle.category
      )
      .slice(0, limit);
  }
}