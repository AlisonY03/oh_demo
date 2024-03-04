import { Friend, friendNew } from '../model/FriendModel'

@Component
export struct ItemView{

  @State item : Friend = friendNew;
  test:(name: string) => void = () => {};

  build(){
    Row(){
      Image($r("app.media.app_icon")).width(40).height(40)
      Text(this.item.name)
        .fontSize(23)
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