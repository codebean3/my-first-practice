// import router from '@ohos.router';
// @Entry
// @Component
// struct CanvasChartPage {
//   @State chartTitle: string = '最近一周数据趋势';
//   @State chartType: string = '';
//   private context: CanvasRenderingContext2D = new CanvasRenderingContext2D();
//
//   private chartData: number[] = [];
//   private labels: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
//   private lineColor: string = '#ffa2d999';
//
//   aboutToAppear() {
//     const params = router.getParams() as Record<string, string>;
//     this.chartType = params?.['chartType'] || '';
//     this.chartTitle = this.getChartTitle();
//     this.updateChartData();
//   }
//
//   getChartTitle(): string {
//     switch (this.chartType) {
//       case 'humidity': return '最近一周湿度趋势 (%)';
//       case 'temperature': return '最近一周温度变化 (°C)';
//       case 'light': return '最近一周光照强度 (lux)';
//       case 'irrigation': return '最近一周灌溉数据 (ml)';
//       default: return '最近一周数据趋势';
//     }
//   }
//   updateChartData() {
//     switch (this.chartType) {
//       case 'humidity':
//         this.chartData = [65, 62, 58, 55, 60, 63, 68];
//         this.lineColor = '#ffa2d999';
//         break;
//       case 'temperature':
//         this.chartData = [22, 24, 26, 28, 25, 23, 21];
//         this.lineColor = '#ff6b6b';
//         break;
//       case 'light':
//         this.chartData = [450, 600, 750, 800, 650, 500, 400];
//         this.lineColor = '#ffd93d';
//         break;
//       case 'irrigation':
//         this.chartData = [200, 180, 220, 250, 230, 210, 190];
//         this.lineColor = '#4d96ff';
//         break;
//       default:
//         this.chartData = [65, 62, 58, 55, 60, 63, 68];
//         this.lineColor = '#4d96ff';
//     }
//   }
//
//   build() {
//     Column() {
//       // 标题栏
//       Row() {
//         Button('返回')
//           .fontSize(16)
//           .backgroundColor('#ffa2d999')
//           .width(80)
//           .height(40)
//           .borderRadius(20)
//           .onClick(() => {
//             router.back();
//           })
//
//         Text(this.chartTitle)
//           .fontSize(20)
//           .fontWeight(FontWeight.Bold)
//           .layoutWeight(1)
//           .textAlign(TextAlign.Center)
//       }
//       .width('100%')
//       .padding(10)
//       .backgroundColor('#f5f5f5')
//
//       // 图表容器
//       Column() {
//         Text('数据趋势图')
//           .fontSize(18)
//           .fontColor('#333333')
//           .margin({ bottom: 15 })
//         Stack() {
//           Column() {
//             // Y轴
//             Row() {
//               Column({space:2}) {
//                 ForEach(this.getYAxisLabels(), (label: string) => {
//                   Text(label)
//                     .fontSize(12)
//                     .fontColor('#666666')
//                     .width(40)
//                     .textAlign(TextAlign.End)
//                     .margin({top:32})//bottom: 40,
//                 })
//               }
//               .width(5)
//               .height(250)
//
//               // 图表主体
//               Stack() {
//                 // 网格背景
//                 Column({space:2}) {
//                   ForEach([0, 1, 2, 3, 4], (item:number) => {
//                     Line()
//                       .width('100%')
//                       .height(2)
//                       .backgroundColor('#f0f0f0')
//                       .margin({ top: 45})
//                   })
//                 }
//                 .width('100%')
//                 .height(250)
//
//                 // 数据线和点
//                 Column() {
//                   // 连接线
//                   Polyline()
//                     .width('100%')
//                     .height(250)
//                     .points(this.calculateSmoothLinePoints())
//                     .strokeWidth(3)
//                     .fill('transparent')
//                     .stroke(this.lineColor)
//
//                   // 数据点
//                   Row() {
//                     ForEach(this.chartData, (item:number, index) => {
//                       Column() {
//                         // 数据点
//                         Circle()
//                           .width(14)
//                           .height(14)
//                           .fill(this.lineColor)
//                           .stroke('#ffffff')
//
//                         // 数据值标签
//                         Text(item.toString())
//                           .fontSize(12)
//                           .fontColor('#333333')
//                           .fontWeight(FontWeight.Bold)
//                           .margin({ top: 8 })
//                           .backgroundColor('#ffffff')
//                           .padding(4)
//                           .borderRadius(4)
//                       }
//                       .layoutWeight(1)
//                       .alignItems(HorizontalAlign.Center)
//                     })
//                   }
//                   .width('100%')
//                   .height(250)
//                 }
//                 .width('100%')
//                 .height(250)
//                 .padding({ left: 10, right: 10 })
//               }
//               .layoutWeight(1)
//               .height(250)
//             }
//
//             // X轴
//             Row() {
//               ForEach(this.labels, (label: string) => {
//                 Text(label)
//                   .fontSize(12)
//                   .fontColor('#666666')
//                   .layoutWeight(1)
//                   .textAlign(TextAlign.Center)
//               })
//             }
//             .width('100%')
//             .margin({ left:20,top: 10 })
//           }
//           .width('105%')
//         }
//         .width('100%')
//         .padding(20)
//         .backgroundColor('#ffffff')
//         .border({ width: 1, color: '#e0e0e0' })
//         .borderRadius(12)
//         .shadow({ radius: 8, color: '#1a000000', offsetX: 2, offsetY: 2 })
//       }
//       .width('95%')
//       .margin({ top: 20 })
//
//       // 数据统计卡片
//       Column({ space: 8 }) {
//         Text('数据统计')
//           .fontSize(16)
//           .fontColor('#333333')
//           .fontWeight(FontWeight.Bold)
//           .width('100%')
//           .textAlign(TextAlign.Start)
//
//         Row() {
//           Column() {
//             Text('最高值')
//               .fontSize(12)
//               .fontColor('#999999')
//             Text(this.getMaxValue().toString())
//               .fontSize(16)
//               .fontColor('#ff6b6b')
//               .fontWeight(FontWeight.Bold)
//           }
//           .layoutWeight(1)
//           .alignItems(HorizontalAlign.Center)
//
//           Column() {
//             Text('最低值')
//               .fontSize(12)
//               .fontColor('#999999')
//             Text(this.getMinValue().toString())
//               .fontSize(16)
//               .fontColor('#4d96ff')
//               .fontWeight(FontWeight.Bold)
//           }
//           .layoutWeight(1)
//           .alignItems(HorizontalAlign.Center)
//
//           Column() {
//             Text('平均值')
//               .fontSize(12)
//               .fontColor('#999999')
//             Text(this.getAverage().toFixed(1))
//               .fontSize(16)
//               .fontColor('#333333')
//               .fontWeight(FontWeight.Bold)
//           }
//           .layoutWeight(1)
//           .alignItems(HorizontalAlign.Center)
//         }
//         .width('100%')
//
//         // 趋势指示器
//         Row() {
//           Text('整体趋势:')
//             .fontSize(14)
//             .fontColor('#666666')
//
//           Text(this.getTrendDirection())
//             .fontSize(14)
//             .fontColor(this.getTrendDirection() === '上升' ? '#ff6b6b' : '#4d96ff')
//             .fontWeight(FontWeight.Bold)
//             .margin({ left: 5 })
//         }
//         .width('100%')
//         .justifyContent(FlexAlign.Start)
//         .margin({ top: 5 })
//       }
//       .width('95%')
//       .padding(20)
//       .backgroundColor('#f9f9f9')
//       .borderRadius(12)
//       .margin({ top: 20 })
//
//     }
//     .width('100%')
//     .height('100%')
//     .backgroundColor('#ffffff')
//   }
//   // Y轴
//   getYAxisLabels(): string[] {
//     const max = Math.max(...this.chartData);
//     const min = Math.min(...this.chartData);
//     const range = max - min;
//     const step = range / 4;
//
//     return [
//       Math.ceil(max).toString(),
//       Math.ceil(max - step).toString(),
//       Math.ceil(max - step * 2).toString(),
//       Math.ceil(max - step * 3).toString(),
//       Math.floor(min).toString()
//     ];
//   }
//   // 计算平滑的折线点
//   calculateSmoothLinePoints(): number[] {
//     const points: number[] = [];
//     const maxValue = Math.max(...this.chartData);
//     const minValue = Math.min(...this.chartData);
//     const range = maxValue - minValue;
//     const dataCount = this.chartData.length;
//
//     this.chartData.forEach((value, index) => {
//       const x = 30 + (index / (dataCount - 1)) * 280; // 留出边距
//       const y = 30 + ((maxValue - value) / range) * 190; // 倒转Y轴
//       points.push(x, y);
//     });
//
//     return points;
//   }
//   getMaxValue(): number {
//     return Math.max(...this.chartData);
//   }
//   getMinValue(): number {
//     return Math.min(...this.chartData);
//   }
//   getAverage(): number {
//     const sum = this.chartData.reduce((a, b) => a + b, 0);
//     return sum / this.chartData.length;
//   }
//   getTrendDirection(): string {
//     return this.chartData[this.chartData.length - 1] > this.chartData[0] ? '上升' : '下降';
//   }
// }
import router from '@ohos.router';
@Entry
@Component
struct CanvasChartPage {
  @State chartTitle: string = '最近一周数据趋势';
  @State chartType: string = '';
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D();

  private chartData: number[] = [];
  private labels: string[] = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
  private lineColor: string = '#ffa2d999';
  @State containerWidth: number = 300;
  @State containerHeight: number = 250;
  aboutToAppear() {
    const params = router.getParams() as Record<string, string>;
    this.chartType = params?.['chartType'] || '';
    this.chartTitle = this.getChartTitle();
    this.updateChartData();
  }
  getChartTitle(): string {
    switch (this.chartType) {
      case 'humidity': return '最近一周湿度趋势 (%)';
      case 'temperature': return '最近一周温度变化 (°C)';
      case 'light': return '最近一周光照强度 (lux)';
      case 'irrigation': return '最近一周灌溉数据 (ml)';
      default: return '最近一周数据趋势';
    }
  }
  updateChartData() {
    switch (this.chartType) {
      case 'humidity':
        this.chartData = [65, 62, 58, 55, 60, 63, 68];
        this.lineColor = '#ffa2d999';
        break;
      case 'temperature':
        this.chartData = [22, 24, 26, 28, 25, 23, 21];
        this.lineColor = '#ff6b6b';
        break;
      case 'light':
        this.chartData = [450, 600, 750, 800, 650, 500, 400];
        this.lineColor = '#ffd93d';
        break;
      case 'irrigation':
        this.chartData = [200, 180, 220, 250, 230, 210, 190];
        this.lineColor = '#4d96ff';
        break;
      default:
        this.chartData = [65, 62, 58, 55, 60, 63, 68];
        this.lineColor = '#4d96ff';
    }
  }
  build() {
    Column() {
      Row() {
        Button('返回')
          .fontSize(16)
          .backgroundColor('#ffa2d999')
          .width(80)
          .height(40)
          .borderRadius(20)
          .onClick(() => {
            router.back();
          })

        Text(this.chartTitle)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#f5f5f5')

      // 图表容器
      Column() {
        Text('数据趋势图')
          .fontSize(18)
          .fontColor('#333333')
          .margin({ bottom: 15 })

        Stack() {
          Column() {
            // Y轴
            Row() {
              Column({space: 2}) {
                ForEach(this.getYAxisLabels(), (label: string) => {
                  Text(label)
                    .fontSize(12)
                    .fontColor('#666666')
                    .width(40)
                    .textAlign(TextAlign.End)
                    .margin({top: 32})
                })
              }
              .width(5)
              .height(250)

              // 图表主体
              Stack() {
                // 网格背景
                Column({space: 2}) {
                  ForEach([0, 1, 2, 3, 4], (item:number) => {
                    Line()
                      .width('100%')
                      .height(2)
                      .backgroundColor('#f0f0f0')
                      .margin({ top: 45})
                  })
                }
                .width('100%')
                .height(250)

                // 数据线和点
                Column() {
                  // 连接线
                  Polyline()
                    .width('100%')
                    .height(250)
                    .points(this.calculateLinePoints())
                    .strokeWidth(3)
                    .fill('transparent')
                    .stroke(this.lineColor)

                  // 数据点 - 使用Stack定位确保与折线位置一致
                  Stack() {
                    ForEach(this.chartData, (item:number, index) => {
                      Column() {
                        Circle()
                          .width(14)
                          .height(14)
                          .fill(this.lineColor)
                          .stroke('#ffffff')
                          .strokeWidth(2)

                        Text(item.toString())
                          .fontSize(12)
                          .fontColor('#333333')
                          .fontWeight(FontWeight.Bold)
                          .margin({ top: 8 })
                          .backgroundColor('#ffffff')
                          .padding(4)
                          .borderRadius(4)
                      }
                      .position({
                        x: this.calculatePointX(index) - 7, // 居中调整
                        y: this.calculatePointY(item) - 7   // 居中调整
                      })
                    })
                  }
                  .width('100%')
                  .height(250)
                }
                .width('100%')
                .height(250)
                .padding({ left: 10, right: 10 })
                .onAreaChange((oldValue, newValue) => {
                  this.containerWidth = newValue.width as number;
                  this.containerHeight = newValue.height as number;
                })
              }
              .layoutWeight(1)
              .height(250)
            }

            // X轴
            Row() {
              ForEach(this.labels, (label: string) => {
                Text(label)
                  .fontSize(12)
                  .fontColor('#666666')
                  .layoutWeight(1)
                  .textAlign(TextAlign.Center)
              })
            }
            .width('100%')
            .margin({ left: 20, top: 10 })
          }
          .width('105%')
        }
        .width('100%')
        .padding(20)
        .backgroundColor('#ffffff')
        .border({ width: 1, color: '#e0e0e0' })
        .borderRadius(12)
        .shadow({ radius: 8, color: '#1a000000', offsetX: 2, offsetY: 2 })
      }
      .width('95%')
      .margin({ top: 20 })

      // 数据统计卡片 - 保持不变
      Column({ space: 8 }) {
        Text('数据统计')
          .fontSize(16)
          .fontColor('#333333')
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .textAlign(TextAlign.Start)

        Row() {
          Column() {
            Text('最高值')
              .fontSize(12)
              .fontColor('#999999')
            Text(this.getMaxValue().toString())
              .fontSize(16)
              .fontColor('#ff6b6b')
              .fontWeight(FontWeight.Bold)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Text('最低值')
              .fontSize(12)
              .fontColor('#999999')
            Text(this.getMinValue().toString())
              .fontSize(16)
              .fontColor('#4d96ff')
              .fontWeight(FontWeight.Bold)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Text('平均值')
              .fontSize(12)
              .fontColor('#999999')
            Text(this.getAverage().toFixed(1))
              .fontSize(16)
              .fontColor('#333333')
              .fontWeight(FontWeight.Bold)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')

        // 趋势指示器
        Row() {
          Text('整体趋势:')
            .fontSize(14)
            .fontColor('#666666')

          Text(this.getTrendDirection())
            .fontSize(14)
            .fontColor(this.getTrendDirection() === '上升' ? '#ff6b6b' : '#4d96ff')
            .fontWeight(FontWeight.Bold)
            .margin({ left: 5 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .margin({ top: 5 })
      }
      .width('95%')
      .padding(20)
      .backgroundColor('#f9f9f9')
      .borderRadius(12)
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }

  // Y轴
  getYAxisLabels(): string[] {
    const max = Math.max(...this.chartData);
    const min = Math.min(...this.chartData);
    const range = max - min;
    const step = range / 4;

    return [
      Math.ceil(max).toString(),
      Math.ceil(max - step).toString(),
      Math.ceil(max - step * 2).toString(),
      Math.ceil(max - step * 3).toString(),
      Math.floor(min).toString()
    ];
  }

  // 计算点坐标
  calculateLinePoints(): number[] {
    if (this.chartData.length === 0) return [];

    const points: number[] = [];
    const maxValue = Math.max(...this.chartData);
    const minValue = Math.min(...this.chartData);
    const range = maxValue - minValue || 1;

    const chartWidth = this.containerWidth - 40;
    const chartHeight = 250;
    this.chartData.forEach((value, index) => {
      const x = this.calculatePointX(index,);
      const y = this.calculatePointY(value);
      points.push(x, y);
    });

    return points;
  }
  calculatePointX(index: number): number {
    const chartWidth = this.containerWidth - 40;
    const pointCount = this.chartData.length;
    const leftMargin = 20;
    const horizontalSpacing = 5;
    // 计算每个点之间的间距
    const availableWidth = chartWidth - leftMargin * 0.5;//2
    const spacing = Math.max(horizontalSpacing, availableWidth / (pointCount - 1));

    return leftMargin + index * spacing;
  }
  // 计算数据点Y坐标
  calculatePointY(value: number): number {
    const maxValue = Math.max(...this.chartData);
    const minValue = Math.min(...this.chartData);
    const range = maxValue - minValue || 1;
    const chartHeight = 250;
    const topMargin = -200;
    const bottomMargin = 260;

    return topMargin + ((maxValue - value) / range) * (chartHeight - topMargin - bottomMargin);
  }

  getMaxValue(): number {
    return Math.max(...this.chartData);
  }

  getMinValue(): number {
    return Math.min(...this.chartData);
  }

  getAverage(): number {
    const sum = this.chartData.reduce((a, b) => a + b, 0);
    return sum / this.chartData.length;
  }

  getTrendDirection(): string {
    return this.chartData[this.chartData.length - 1] > this.chartData[0] ? '上升' : '下降';
  }
}