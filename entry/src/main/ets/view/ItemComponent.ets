import { Friend, friendNew } from '../model/FriendModel'

@Extend(Text)
function TextStyle(){
  .fontSize(36).fontColor(Color.Blue).margin(12)
}

@Component
export struct ItemView{

  @State item : Friend = friendNew;
  test:(name: string) => void = () => {};

  build(){
    Row(){
      Image($r("app.media.app_icon")).width(40).height(40)
      Text(this.item.name).TextStyle()
    }
    .height(100)
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.test(this.item.name);
    })
  }

  setClickEvent(){

  }

}