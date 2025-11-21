import { PlaceDialog } from "./PlaceDialog"
import { SelectedAddress } from '../model/AddressData'

@Entry
@Component
struct Index {
  @State province: string = ''
  @State city: string = ''
  @State county: string = ''

  placeDialogController: CustomDialogController = new CustomDialogController({
    builder: PlaceDialog({
      onConfirm: (result: SelectedAddress) => {
        this.province = result.province
        this.city = result.city
        this.county = result.county
      },
      initialProvince: this.province,
      initialCity: this.city,
      initialCounty: this.county
    }),
    alignment: DialogAlignment.Bottom,
    cornerRadius: {
      topLeft: 16,
      topRight: 16
    },
    width: "100%",
    height: "50%",
    backgroundColor: Color.White,
    customStyle: true
  })

  build() {
    Column() {
      Column() {
        // 地区
        Row() {
          Text("地区").fontSize(16).fontColor("#646566")
          Text(this.province && this.city && this.county
            ? `${this.province} ${this.city} ${this.county}`
            : '选择省/市/区')
            .fontSize(16)
            .fontColor(this.province ? '#323233' : '#c8c9cc')
            .layoutWeight(1)
            .margin({ left: 20 })
          Image($r("app.media.startIcon"))
            .width(16)
            .height(16)
        }
        .width('100%')
        .height(60)
        .padding({ left: 20, right: 20, top: 10, bottom: 10 })
        .backgroundColor(Color.White)
        .onClick(() => {
          this.placeDialogController.open()
        })
      }
      .borderRadius(8)
      .margin(12)
    }
    .backgroundColor("#f2f2f2")
    .height('100%')
    .width('100%')
  }
}